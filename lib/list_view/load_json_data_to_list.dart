import 'dart:convert';

import 'package:firstproject/model/trx_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadJsonFileToList extends StatefulWidget {
  LoadJsonFileToList({Key? key}) : super(key: key);

  @override
  _LoadJsonFileToListState createState() => _LoadJsonFileToListState();
}

class _LoadJsonFileToListState extends State<LoadJsonFileToList> {
  List<TransModel>? trxHistoryDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildListView());
  }

  Widget buildListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final obje = this.trxHistoryDetails?[index];
        return Card(
          elevation: 5,
          child: ListTile(
            title: Text("${obje?.amount ?? ""}"),
            leading: Text(obje?.cardNbr ?? ""),
          ),
        );
      },
      itemCount: this.trxHistoryDetails?.length,
    );
  }

  @override
  void initState() {
    super.initState();
    loadJsonFile();
  }

  loadJsonFile() async {
    final data = await rootBundle.loadString("assets/sample.json");
    final jsonObj = json.decode(data);
    final transModel = TransHistoryMode.fromJson(jsonObj);
    print(transModel.errors);
    print(transModel.trxHistoryDetails);
    setState(() {
      this.trxHistoryDetails = transModel.trxHistoryDetails;
    });
    print(jsonObj);
  }
}
