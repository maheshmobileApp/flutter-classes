import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GetApiCall extends StatefulWidget {
  GetApiCall({Key? key}) : super(key: key);

  @override
  _GetApiCallState createState() => _GetApiCallState();
}

class _GetApiCallState extends State<GetApiCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getDataFromServer();
    getTheDataFromServerUseDio();
  }

  getTheDataFromServerUseDio() async {
    try {
      var response = await Dio().get(
          'https://atxtest.atx.my/api/v1/customer_parcels/orders/submit/me',
          options: Options(headers: {
            "Content-Type": 'application/json',
            'Token':
                "16353857202601471976262gqy7esub6xbbgz5w5fue2nedz9se46cqeq7f4q4k0vbmr37rh72pyet2p3v8952gr6csrmemkzgxigp7d3gdren9es33urgjj8z7trv01u87uvf6wbxs891"
          }));
      print(response);
      print(response.data);
    } catch (e) {
      print("dio error  $e");
    }
  }

  getDataFromServer() async {
    //base url : ""
    //method type : GET
    //parameters :
    //headders
    //body:
    print("call ");
    try {
      var url = Uri.parse(
          'https://atxtest.atx.my/api/v1/customer_parcels/orders/submit/me');

      final res = await http.get(url, headers: {
        "Content-Type": 'application/json',
        'Token':
            "16353857202601471976262gqy7esub6xbbgz5w5fue2nedz9se46cqeq7f4q4k0vbmr37rh72pyet2p3v8952gr6csrmemkzgxigp7d3gdren9es33urgjj8z7trv01u87uvf6wbxs891"
      });

      print(res.statusCode);
      print(res.body);
    } catch (e) {
      print(e);
    }
  }
}
