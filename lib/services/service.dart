import 'package:app/core/constants.dart';
import 'package:app/models/news_model.dart';
import 'package:dio/dio.dart';

class NewServices {
  static Future<NewsModel> getNews() async {
    Response res = await Dio().get(Constants.kapiAddress);
    if (res.statusCode == 200) {
      return NewsModel.fromJson(res.data);
    } else {
      throw (Exception("Network error"));
    }
  }
}
