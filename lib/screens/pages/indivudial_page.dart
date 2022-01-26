import 'package:app/core/constants.dart';
import 'package:app/sizeconfig/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IndivudialPage extends StatefulWidget {
  var indata;
  IndivudialPage({Key? key, this.indata}) : super(key: key);

  @override
  _IndivudialPageState createState() => _IndivudialPageState();
}

class _IndivudialPageState extends State<IndivudialPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: getProportionScreenHeight(320),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(widget.indata.urlToImage),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: getProportionScreenHeight(55),
                  left: getProportionScreenWidth(12.0),
                  right: getProportionScreenWidth(12.0)),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionScreenHeight(150),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.indata.publishedAt.toString().substring(0, 10),
                        style: TextStyle(color: Constants.colorText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionScreenHeight(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionScreenWidth(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: getProportionScreenHeight(60),
                      width: getProportionScreenHeight(5),
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: getProportionScreenWidth(10),
                    ),
                    Expanded(
                      child: Text(
                        widget.indata.title,
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionScreenHeight(20),
                ),
                Text(widget.indata.description),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
