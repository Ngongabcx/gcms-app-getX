import 'dart:convert';

import 'package:gcms/app/modules/Authentication/auth_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
   Future<Auth> refreshToken(Map data) async {
    try {
      final response = await post("$kApiBaseURL/authmanagement/refreshToken", data);
      if (response.status.hasError) {
        return Future.error(response.body["errors"].join(","));
      } else {
        Map<String, dynamic> resp = jsonDecode(response.bodyString);
        return Auth.fromJson(resp);
      }
    } catch (exception) {
      print('<<===REFRESH TOKEN EXCEPTION==> $exception');
      return Future.error(exception);
    }
  }
  Future<String> getUserDetails(String id) async {
    try {
      final response = await get("$kApiBaseURL/members/$id");
      if (response.status.hasError) {
        return Future.error(response.body["errors"].join(","));
      } else {
        return response.bodyString;
      }
    } catch (exception) {
      print('<<===GET USER DETAILS EXCEPTION==> $exception');
      return Future.error(exception);
    }
  }
}
