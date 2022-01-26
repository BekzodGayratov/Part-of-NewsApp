import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static Color colorText = Colors.white;
  static Color colorText2 = Colors.black;

   static String kapiKey = dotenv.env['API_KEY']!;
  static String kapiAddress =
      "https://newsapi.org/v2/everything?q=apple&from=2022-01-24&to=2022-01-24&sortBy=popularity&apiKey=$kapiKey";
}
