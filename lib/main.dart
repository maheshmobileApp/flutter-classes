import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Project"),
          actions: const [
            Text("1"), Text("2"),
          ],
          centerTitle: true,
        ),
        body: designColumn(),
      ),
    );
  }

  Widget designColumn() {
    return Container(
      child: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("sjdofjasp jrpwjrpajeirwe"),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 100,
              color: Colors.red,
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              color: Colors.blue,
              width: 200,
            ),
            Container(
              height: 100,
              color: Colors.yellow,
              width: 200,
            ),
            Container(
              height: 100,
              color: Colors.orange,
              width: 200,
            ),
            Container(
              height: 100,
              color: Colors.grey,
              width: 200,
            ),
            Container(
              height: 100,
              color: Colors.green,
              width: 200,
            ),
      
      
      
        ],
        ),
      ),
    );
  }

  Widget designContainer() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 5),
          borderRadius: const BorderRadius.all(Radius.circular(10))

      ),
      margin: const EdgeInsets.all(10),
      //color: Colors.green,
      width: 200,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        // padding: const EdgeInsets.only(top:30,left: 10,right: 10,bottom:30),
        child: Container(
          color: Colors.red,
          child: Text("hello"),
        ),
      ),
    );
  }
}


//Row and Column

//child -> Container,SingleChildScrollView,SizedBox
//Childerns - > Row, Column

//Task: container, list,map tasks and Row