import 'package:app/core/constants.dart';
import 'package:app/models/news_model.dart';
import 'package:app/screens/pages/log.dart';
import 'package:app/services/service.dart';
import 'package:app/sizeconfig/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
      future: NewServices.getNews(),
      builder: (context, AsyncSnapshot<NewsModel> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("API has problem"),
          );
        } else {
          forward = snapshot.data!.articles!;
          var data = snapshot.data!.articles;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  data![index].urlToImage!),
                            )),
                        child: Padding(
                          padding:
                              EdgeInsets.all(getProportionScreenHeight(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "2 hours ago",
                                    style:
                                        TextStyle(color: Constants.colorText),
                                  ),
                                  Icon(
                                    Icons.bookmark,
                                    color: Constants.colorText,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionScreenHeight(40),
                              ),
                              Text(
                                data[index].title!.substring(0, 20),
                                style: TextStyle(
                                    fontSize: 30.0, color: Constants.colorText),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/indivudial',
                            arguments: data[index]);
                      },
                    );
                  },
                  itemCount: data!.length,
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionScreenWidth(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Latest news",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionScreenHeight(340),
                        width: getProportionScreenWidth(400),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionScreenHeight(10)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: getProportionScreenHeight(110),
                                      width: getProportionScreenWidth(110),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                                data[index].urlToImage!),
                                          )),
                                    ),
                                    SizedBox(
                                      width: getProportionScreenWidth(5),
                                    ),
                                    Column(
                                      children: [
                                        Text(data[index + 1]
                                            .title!
                                            .substring(0, 10)),
                                        SizedBox(
                                          height: getProportionScreenHeight(10),
                                        ),
                                        Row(
                                          children: [
                                            const Text("15 minutes"),
                                            SizedBox(
                                              width:
                                                  getProportionScreenWidth(40),
                                            ),
                                            const Icon(Icons.bookmark)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ));
                          },
                          itemCount: data.length - 1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
