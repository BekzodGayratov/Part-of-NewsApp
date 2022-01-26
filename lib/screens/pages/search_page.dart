import 'package:app/core/constants.dart';
import 'package:app/screens/pages/log.dart';
import 'package:app/sizeconfig/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Set _searchedTitle = {};
  Set _searchedPic = {};
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionScreenWidth(10.0),
              vertical: getProportionScreenHeight(10.0),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0))),
              onChanged: (v) {
                for (int i = 0; i < forward.length; i++) {
                  if (v.length == 0) {
                    _searchedTitle.clear();
                    _searchedPic.clear();
                    setState(() {});
                  } else if (forward[i]
                      .title!
                      .toLowerCase()
                      .contains(v.toLowerCase())) {
                    _searchedTitle.add(forward[i].title);
                    _searchedPic.add(forward[i].urlToImage);
                    setState(() {});
                  }
                }
              },
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                height: getProportionScreenHeight(220),
                width: getProportionScreenWidth(50),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(_searchedPic.toList()[index]),
                    )),
                child: Center(
                  child:
                      Text(_searchedTitle.toList()[index].toString().substring(0, 20),style: TextStyle(fontSize: 30.0,color: Constants.colorText),),
                ),
              );
            },
            itemCount: _searchedPic.length,
          ),
        )
      ],
    );
  }
}
