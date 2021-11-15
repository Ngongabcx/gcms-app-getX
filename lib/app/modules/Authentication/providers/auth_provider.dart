import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../auth_model.dart';

class AuthProvider extends GetConnect {
  //LOGIN
  Future<Auth> login(Map data) async {
    try {
      final response = await post("$kApiBaseURL/authmanagement/login", data);
      //final body = json.decode(response.bodyString);
      if (response.status.hasError) {
        return Future.error(response.body["errors"].join(","));
      } else {
        // print("DECODED   ----------->" +
        //     jsonDecode(response.bodyString));
        Map<String, dynamic> a = jsonDecode(response.bodyString);
        return Auth.fromJson(a);
      }
    } catch (exception) {
      print('<<===EXCEPTION 1==> $exception');
      return Future.error(exception);
    }
  }
}