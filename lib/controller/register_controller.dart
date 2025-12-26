import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/component/storage_constant.dart';
import 'package:new_techblog/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController activeCodeEditingController = TextEditingController();

  dynamic userid = "";
  dynamic email = "";
  final box = GetStorage();

  register() async {
    Map<String, dynamic> map = {
      "email": emailEditingController.text,
      "command": "register"
    };
    var response = await DioService().postData(map, ApiConstant.postRegister);
    userid = response["user_id"];
    email = emailEditingController.text;
  }

  verify() async {
    Map<String, dynamic> map = {
      "email": email,
      "user_id": userid,
      "code": activeCodeEditingController.text,
      "command": "verify"
    };
    var response = await DioService().postData(map, ApiConstant.postRegister);

    if (response["response"] == "verified") {
      box.write(StorageConstant.userId, response["user_id"]);
      box.write(StorageConstant.token, response["token"]);

      print("read::" + box.read(StorageConstant.userId));
      print("read::" + box.read(StorageConstant.token));
    } else {
      log("error");
    }
  }
}
