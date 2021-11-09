import 'package:firstproject/api_call/oders_model.dart';
import 'package:firstproject/widget/alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GetApiCall extends StatefulWidget {
  GetApiCall({Key? key}) : super(key: key);

  @override
  _GetApiCallState createState() => _GetApiCallState();
}

class _GetApiCallState extends State<GetApiCall> {
  Map<String, dynamic>? responseObject;
  OrdersModel? ordersData;
  Dio _dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListView(),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }

  Widget buildListView() {
    //Build the list view to display the orders
    //parse the cp_orders into one object
    // final cpOrders = this.responseObject?["cp_orders"];
    final cpOrders = this.ordersData?.cpOrders;
    if (cpOrders == null) {
      return Container();
    }
    return ListView.builder(
        itemCount: cpOrders.length,
        itemBuilder: (BuildContext contex, int index) {
          final value = cpOrders[index];
          return ListTile(
            title: Text(value.firstSenderName ?? ""),
            subtitle: Text(value.firstRecipientName ?? ""),
          );
       /*   return ListTile(
            title: Text(value["first_sender_name"]),
            subtitle: Text(value["first_recipient_name"]),
          );*/

          // return EmpListTile(name: value);
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getDataFromServer();
    //setp 1: call this method to get the value from server
    getTheDataFromServerUseDio();
  }

  getData() async {
    setState(() async {
      //step3: store the response data into global variable (responseObject is global variable)
      this.responseObject = await getTheDataFromServerUseDio();
    });
  }

  Future<Map<String, dynamic>> getTheDataFromServerUseDio() async {
    //step2:using dio package to the data from server
    // we are passing base url and headers in option variable

    _dio.interceptors.addAll([
      InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers = {
              "Content-Type": 'application/json',
              'Token':
                  "1635817835260147197626acus7fkb8wj9dhjj7lz41d36jq1zlt5tdk9fnm0kp01z2j5ibjkm3xuviwp5pn1thpalb7sj7brm2t2jy9k55sldclqmazj7i29ev5x71bhn7zi7i0cliw5w"
            };
            return handler.next(options);
          },
          onResponse: (response, handler) {},
          onError: (error, handler) {
            print("error $error");
            print(error.response?.data);
            if (error.response?.statusCode == 400) {}
          })
    ]);

    try {
      var response = await _dio.get(
        'https://atxtest.atx.my/api/v1/customer_parcels/orders/submit/me',
      );
      print(response);
      //response.data contains three keys, message,cp_orders,pagination-
      final responseData = response.data;
      print(response.data);
      final ordersData = OrdersModel.fromJson(responseData);
      setState(() {
        this.ordersData = ordersData;
        //this.responseObject = responseData;
      });
      return responseData;
    } on DioError catch (e) {
      //e.response.statusCode

      showAlertDialog(context, "Error",
          "Please check the request status Code is ${e.response?.statusCode}",
          () {
        print("ok action");
        Navigator.of(context).pop();
      }, () {
        print("cancel action");
        Navigator.of(context).pop();
      });
     
      print("dio error  $e");
      return {"": ""};
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
            '1635817835260147197626acus7fkb8wj9dhjj7lz41d36jq1zlt5tdk9fnm0kp01z2j5ibjkm3xuviwp5pn1thpalb7sj7brm2t2jy9k55sldclqmazj7i29ev5x71bhn7zi7i0cliw5w'
      });

      print(res.statusCode);
      print(res.body);
    } catch (e) {
      print(e);
    }
  }
}


//login -> after login save the token in shared -> set the token in all request using interceptors, if toke expire 