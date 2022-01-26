import 'package:app/screens/home_page.dart';
import 'package:app/screens/pages/indivudial_page.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static routeGenerator(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/indivudial':
        return MaterialPageRoute(builder: (context) => IndivudialPage(indata: args));
    }
  }
}
