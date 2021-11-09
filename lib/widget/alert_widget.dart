import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String title, String content,
    Function okAction, Function cancelAction) {
  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            GestureDetector(
              child: Container(
                child: Text("hello"),
              ),
              onTap: () {
                print("hello");
              },
            ),
            TextButton(
                onPressed: () {
                  okAction();
                },
                child: const Text("Ok")),
            TextButton(
                onPressed: () {
                  cancelAction();
                },
                child: const Text("cancel"))
          ],
        );
      });
}
