import 'package:api_all/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PutController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  final _isError = ''.obs;
  String get isError => _isError.value;
  final ApiBase apiBase = ApiBase();
  final TextEditingController createdAt = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController avatar = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController creatAt = TextEditingController();

  Future<void> putData(
      {required String? id,
      required int? createdAt,
      required String? name,
      required String? avatar,
      required int? creatAt,
      required BuildContext context}) async {
    final parameter = {
      "id": id,
      "createdAt": createdAt,
      "name": name,
      "avatar": avatar,
      "creatAt": creatAt
    };

    await apiBase.put(
        'https://65804ce16ae0629a3f54dbdb.mockapi.io/Apiendpoint/PostApi/$id',
        parameter, (data) {
      _isLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green, content: Text("Success")));
    }, (error) {
      _isLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: Colors.red, content: Text("Error")));
    });
  }
}
