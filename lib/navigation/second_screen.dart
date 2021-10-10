import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: Container(
          color: Colors.green,
          child: TextButton(
            //style: ButtonStyle(backgroundColor: Color.blue),
            child: Text("Back"),
            onPressed: () {
              print("back button");
              Navigator.pop(context);
            },
          ),
        ));
  }
}
