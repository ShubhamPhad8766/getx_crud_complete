// ignore_for_file: unused_element, non_constant_identifier_names

import 'package:api_all/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final ApiBase apiBase = ApiBase();
  final isLoading = false.obs;
  bool get _isLoading => isLoading.value;
  final isError = ''.obs;
  String get _isError => isError.value;
  final TextEditingController descrition = TextEditingController();
  final TextEditingController StartTime = TextEditingController();
  final TextEditingController EndTime = TextEditingController();

  Future<void> PostData({
    required BuildContext context,
    required int? userId,
    required int? groupId,
    required String? description,
    required String? startTime,
    required String? endTime,
  }) async {
    final parameters = {
      "userId": userId,
      "groupId": groupId,
      "description": description,
      "startTime": startTime,
      "endTime": endTime
    };
    isLoading(true);
    await apiBase.post(
        'https://so1h005xk4.execute-api.ap-south-1.amazonaws.com/peopleManagement/attendancelog/regularization',
        parameters, (data) {
      isLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green, content: Text("Success")));
    }, (error) {
      isLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Please Fill Data",
            style: TextStyle(),
          )));
    });
  }
}
