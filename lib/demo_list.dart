import 'dart:convert';

import 'package:firstproject/trans_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilterListDemo extends StatefulWidget {
  FilterListDemo({Key? key}) : super(key: key);

  @override
  _FilterListDemoState createState() => _FilterListDemoState();
}

class _FilterListDemoState extends State<FilterListDemo> {
  List<TrxHistoryDetails>? trxHistoryDetails;
  List<TrxHistoryDetails>? filtertrxHistoryDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                TextButton(
                  child: Text("All"),
                  onPressed: () {
                    filterTheList("");
                  },
                ),
                TextButton(
                  child: Text("SNAP"),
                  onPressed: () {
                    filterTheList("S");
                  },
                ),
                TextButton(
                  child: Text("Cash"),
                  onPressed: () {
                    filterTheList("C");
                  },
                )
              ],
            ),
            height: 150,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filtertrxHistoryDetails?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final tranModel = filtertrxHistoryDetails![index];
                  return Card(
                    elevation: 3,
                    child: ListTile(
                        trailing: Text(
                          "amount ${tranModel.amount!}",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "benefitType ${tranModel.benefitType}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "trxType ${tranModel.trxType}",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 15),
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }

  loadJson() async {
    String data = await rootBundle.loadString('assets/sample.json');
    final jsonResult = json.decode(data);
    final modelObj = SampleModel.fromJson(jsonResult);
    setState(() {
      trxHistoryDetails = modelObj.trxHistoryDetails;
      filtertrxHistoryDetails = trxHistoryDetails;
    });
  }

  filterTheList(String type) {
    List<TrxHistoryDetails> list = [];
    if (type == "S") {
      list = trxHistoryDetails!
          .where((element) =>
              element.benefitType!.toLowerCase() == "S".toLowerCase())
          .toList();
    } else if (type == "C") {
      list = trxHistoryDetails!
          .where((element) =>
              element.benefitType!.toLowerCase() == "C".toLowerCase())
          .toList();
    } else {
      list = trxHistoryDetails!;
    }
    setState(() {
      filtertrxHistoryDetails = list;
    });
  }
}
