import 'package:flutter/material.dart';

class StateFullWidget extends StatefulWidget {
  StateFullWidget({Key? key}) : super(key: key);

  @override
  _StateFullWidgetState createState() => _StateFullWidgetState();
}

class _StateFullWidgetState extends State<StateFullWidget> {
  String? onchageValue;
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(onchageValue ?? "intial text"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createTextField(),
            )
          ],
        ),
      ),
    );
  }

  TextField createTextField() {
    return TextField(
      controller: _nameController,
      keyboardType: TextInputType.none,
      textInputAction: TextInputAction.done,
      onEditingComplete: () {},
      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
      cursorColor: Colors.red,
      cursorRadius: Radius.circular(20),
      // maxLines: 2,
      obscureText: true,
      //maxLength: 5,
      //      cursorWidth: 20,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)),
          hintText: 'Tell us about yourself',
          helperText: 'Keep it short, this is just a demo.',
          labelText: 'Life story',
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.green,
          ),
          prefixText: ' ',
          suffixText: 'USD',
          suffixStyle: const TextStyle(color: Colors.green)),

      // decoration: InputDecoration(
      //     border: OutlineInputBorder(),
      //     hintText: 'Username',
      //     prefixText: ' ',
      //     suffixStyle: const TextStyle(color: Colors.green)),
      /* decoration: const InputDecoration.collapsed(
        hintText: "enter value",
        hintStyle: TextStyle(color: Colors.orange),
      
        // helperText: "name should be 5 letters",
        // icon: Icon(Icons.email),
        // prefixIcon: Icon(Icons.verified_user),
        // suffixIcon: Icon(Icons.verified_user)
      ),*/
      onChanged: (value) {
        setState(() {
          onchageValue = value;
        });
        print(onchageValue);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _nameController.addListener(() {

    // });
  }
}
