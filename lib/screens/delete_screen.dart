import 'package:api_all/controller/delete_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

final DeleteController deleteController = Get.put(DeleteController());

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: const Text("DELETE"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: deleteController.idController,
                  decoration: const InputDecoration(
                      hintText: 'Enter Id',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      deleteController.deleteData(
                          id: deleteController.idController.text,
                          context: context);
                    },
                    child: const Text("Delete")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
