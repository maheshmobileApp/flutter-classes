

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firstproject/demo_list.dart';
import 'package:firstproject/list_view/emp_list.dart';
import 'package:firstproject/list_view/load_json_data_to_list.dart';
import 'package:firstproject/navigation/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;
  int _counter = 0;
  PageController? _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            SecondScreen(),
            EmpListView(),
            FilterListDemo(),
            LoadJsonFileToList()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInToLinear,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController?.jumpToPage(index);
        },
//onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    /* return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            //style: ButtonStyle(backgroundColor: Color.blue),
            child: Text("push to next"),
            onPressed: () {
              print("press button");
              Navigator.pushNamed(context, "/second");
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => SecondScreen()));

            },
          ),
        ),
      ),
    );*/
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
