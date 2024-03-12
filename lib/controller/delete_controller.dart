import 'package:api_all/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  final _isError = ''.obs;
  String get isError => _isError.value;
  final ApiBase apiBase = ApiBase();
  final TextEditingController idController = TextEditingController();

  void _setLoading(bool value) {
    _isLoading(value);
  }

  void _setError(String errorMessage) {
    _isError(errorMessage);
  }

  Future<void> deleteData(
      {required String? id, required BuildContext context}) async {
    _setLoading(true);

    await apiBase.delete(
      'https://65804ce16ae0629a3f54dbdb.mockapi.io/Apiendpoint/PostApi/$id',
      (data) {
        _setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Success"),
          ),
        );
      },
      (error) {
        _setLoading(false);
        _setError('Error: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Error"),
          ),
        );
      },
    );
  }
}
