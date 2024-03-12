// ignore_for_file: unused_element, unnecessary_brace_in_string_interps, avoid_print

import 'package:api_all/api/api_manager.dart';
import 'package:api_all/model/get_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetController extends GetxController {
  final isLoading = false.obs;
  bool get _isLoading => isLoading.value;
  final isError = ''.obs;
  String get _isError => isError.value;
  final ApiBase apiBase = ApiBase();
  final _getModel = GetModel().obs;
  GetModel get getModel => _getModel.value;

  
  Future<void> getData(BuildContext context) async {
    isLoading(true);
    await apiBase.get(
        'https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/peopleManagement/leave/group/1709116070596/member/1709202217171/',
        (data) {
      isLoading(false);
      _getModel.value = GetModel.fromJson(data);
      print("*************${data}");
      print(_getModel.value);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_getModel.value.message.toString())));
    }, (error) {
      isLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(isError.value)));
    });
  }

  
}
