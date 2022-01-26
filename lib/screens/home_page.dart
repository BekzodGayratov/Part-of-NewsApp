import 'package:app/screens/pages/all_news.dart';
import 'package:app/screens/pages/search_page.dart';
import 'package:app/sizeconfig/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage> {
  int _currentIndex = 0;
  List pages = [
    AllNews(),
    SearchPage(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            tabs: const [
              Tab(text: "All news"),
              Tab(text: "Business"),
              Tab(text: "Politics"),
              Tab(text: "Tech"),
              Tab(text: "Scientist"),
            ],
            onTap: (v) {},
          ),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
          onTap: (v) {
            setState(() {
              _currentIndex = v;
            });
          },
        ),
      ),
    );
  }
}
