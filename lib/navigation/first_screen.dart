

import 'package:firstproject/navigation/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
