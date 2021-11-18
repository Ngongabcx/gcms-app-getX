import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/providers/auth_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthenticationController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  var storage = GetStorage();
  var isProcessing = false.obs;
  TextEditingController usernameController,
      passwordController,
      signUpEmailController,
      signUpPasswordController,
      signUpConfirmPasswordController;
  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPasswordController = TextEditingController();
    signUpConfirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  // Save Data
  void login(Map data) {
    try {
      isProcessing(true);
      AuthProvider().login(data).then((resp) async {
        clearTextEditingControllers();
        isProcessing(false);
        print("ACCESSTOKEN ---> " + resp.info.accessToken);
        print("REFRESHTOKEN ---> " + resp.info.refreshToken);
        ShowSnackBar("Success", "Login Successful.", kPrimaryColor);
        storage.write("isLoggedIn", true);
        storage.write("accessToken", resp.info.accessToken);
        storage.write("refreshToken", resp.info.refreshToken);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  void register(Map data) {
    try {
      isProcessing(true);
      AuthProvider().register(data).then((resp) {
        clearTextEditingControllers();
        isProcessing(false);
        ShowSnackBar("Success", "Login Successful.", kPrimaryColor);
        storage.write("isLoggedIn", true);
        storage.write("accessToken", resp.info.accessToken);
        storage.write("refreshToken", resp.info.refreshToken);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // clear the controllers
  void clearTextEditingControllers() {
    usernameController.clear();
    passwordController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
    signUpConfirmPasswordController.clear();
  }
}
