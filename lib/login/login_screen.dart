

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            loginAction();
          },
          child: Text("login"),
        ),
      ),
    );
  }

  loginAction() async {
    try {
      var response = await _dio.post(
          'https://atxtest.atx.my/api/v1/ext_products/flexi_parking/token',
          data: {"longitude": "", "latitude": "", "type": "web"},
          options: Options(
            headers: {
              "Authorization":
                  "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjE5OTIxNmE1MGJlZTY2ODc5NDNiOGVlZTJiNjY1OTE2NmY4MTVhMmQyNDAwNDk3NDg3MDEzZmZjZWU2MmUwYWExODI2NzAyMDZjZDc0OGYwIn0.eyJhdWQiOiIxIiwianRpIjoiMTk5MjE2YTUwYmVlNjY4Nzk0M2I4ZWVlMmI2NjU5MTY2ZjgxNWEyZDI0MDA0OTc0ODcwMTNmZmNlZTYyZTBhYTE4MjY3MDIwNmNkNzQ4ZjAiLCJpYXQiOjE2MzY2ODIwNTUsIm5iZiI6MTYzNjY4MjA1NSwiZXhwIjoxNjY4MjE4MDU1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.sNuYVyMKQE4VlnR8Axypi8i_J2Yan0P8uqkjksDLrnwNbYbgaojI2-px0sCT6KivtNQ9qYIKKUiq2kbcB94c8fz9EHHcq5tit0uOZO3RQ9t0f18klXcVUuACLWqPD_ipWTK-DG-bi9R5gRM13U9Kvoi-gRxdkooyb3XTMnwnEPI6K6ZjmfLdvGB4QghiLmrjGkFzRieZnd4dTouUCWu3ZQCiBO0Q_lg0S32d_CPJUm_GoU0Bs7e3YnU5GNddx2kNv7rtpp8DRVhDeaTJARjsA1qTXcirmEEMLHBxtLJwJ0EzQrg_lGn5V11I4Do2XguxIueGR0_PJyHDgfRTGrrHDE5o8vh09ERaM9paTXDPbMocFT-4C04SNVhYGeOfKpT7N39l14bULaqSk7lBHeg3kMlhU_YeJER0HzpTit5MO-BPl3yjSvk-f4n6T81MbN7KnNQAIsEiO7ua0AFgquwt9YeWoLbKe6RxQ6Hz-ks9dlgXBHrUqYu9hpBe2boeOcR3XkFNUILaSoWjTOygix-sfaaKkKNKH43xJx79WjmRc3UX8B1jCdG_saoMdGVMQjX5s3nnCNMqamaW_G4lyeXiKx9eBOU-Q-8fQqR0XERrX-vKeOoWZEryiNYIWaxnZB9MAhSZAgu6MKA0r-QXdFbz6k1iI2b2-Q1NX4V5YEPFiBo"
            },
          ));
      print("login response $response");

      final urlElement = response.data["url"] as String;
      final list = urlElement.split("/");
      print(urlElement);
      print(list);
      final token = list.last;

      SharedPreferences per = await SharedPreferences.getInstance();
      per.setString("token", token);
       Navigator.of(context).pushReplacementNamed("/getApiCall");
    } on DioError catch (e) {
      //e.response.statusCode

      print("dio error  $e");
      return {"": ""};
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}


/*

{"message":"success",
"url":"https://flexi-frontend-staging.atx.my/change_location/e899c9c043ca4ac69351e46faf4e7959",
"redirect_url":{"payment_success":"https://atxtest.atx.my/welcome"}}
 */