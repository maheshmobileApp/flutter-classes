import 'package:flutter/material.dart';

class EmpListTile extends StatelessWidget {
  EmpListTile({Key? key, this.name}) : super(key: key);

  String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name ?? ""),
          Text(name ?? ""),
          Text(name ?? ""),
          Text(name ?? ""),
        ],
      ),
    );
  }
}
