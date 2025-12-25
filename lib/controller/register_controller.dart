import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController activeCodeEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  register() async {
    Map<String, dynamic> map = {
      "email": emailEditingController.text,
      "command": "register"
    };
    var response = await DioService().postData(map, ApiConstant.postRegister);
    log("$response");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    register();
    super.onInit();
  }
}
