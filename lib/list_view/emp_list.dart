import 'package:firstproject/list_view/emp_list_tile.dart';
import 'package:flutter/material.dart';

class EmpListView extends StatefulWidget {
  EmpListView({Key? key}) : super(key: key);

  @override
  _EmpListViewState createState() => _EmpListViewState();
}

class _EmpListViewState extends State<EmpListView> {
  final names = [
    "Gregor Clegane",
    "Khal Drogo",
    "Cersei Lannister",
    "Sandor Clegane",
    "Tyrion Lannister",
    "Gregor Clegane",
    "Khal Drogo",
    "Cersei Lannister",
    "Sandor Clegane",
    "Tyrion Lannister",
    "Gregor Clegane",
    "Khal Drogo",
    "Cersei Lannister",
    "Sandor Clegane",
    "Tyrion Lannister",
    "Gregor Clegane",
    "Khal Drogo",
    "Cersei Lannister",
    "Sandor Clegane",
    "Tyrion Lannister",
    "Gregor Clegane",
    "Khal Drogo",
    "Cersei Lannister",
    "Sandor Clegane",
    "Tyrion Lannister"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: designListViewWithSeparater(),
    );
  }

//1.ListView
  Widget designListView() {
    return ListView(
        children: names
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$e"),
                ))
            .toList());
  }

  //2. ListView.builder

  Widget designListViewBuilder() {
    return ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext contex, int index) {
          final value = names[index];
          return EmpListTile(name: value);
        });
  }

Widget designListViewWithSeparater(){
 return ListView.separated(
        itemCount: names.length,
        separatorBuilder:  (BuildContext contex, int index) {
          return Container(
            height: 5,
            color: Colors.grey
          );
        },
        itemBuilder: (BuildContext contex, int index) {
          final value = names[index];
          return EmpListTile(name: value);
        });
}  

  //ListView
  //1. ListView
  //2.ListView.builder
  //3.ListView.separated
  //4. ListView.custom
}
