import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Login"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              keyboardType:TextInputType.emailAddress,
              onChanged: (inputValue) {
                print(inputValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}
