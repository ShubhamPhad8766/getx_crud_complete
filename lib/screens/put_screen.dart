import 'package:api_all/controller/put_controller.dart';
import 'package:api_all/screens/delete_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PutScreen extends StatefulWidget {
  const PutScreen({super.key});

  @override
  State<PutScreen> createState() => _PutScreenState();
}

final PutController putController = Get.put(PutController());

class _PutScreenState extends State<PutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          title: const Text("PUT"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeleteScreen(),
                      ));
                },
                icon: const Icon(Icons.arrow_forward))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: putController.name,
                  decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: putController.id,
                  decoration: const InputDecoration(
                      hintText: 'Id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: putController.avatar,
                  decoration: const InputDecoration(
                      hintText: 'Avatar',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: putController.creatAt,
                  decoration: const InputDecoration(
                      hintText: 'CreatAt',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: putController.createdAt,
                  decoration: const InputDecoration(
                      hintText: 'CreatedAt',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      int createdAt =
                          int.tryParse(putController.createdAt.text) ?? 0;
                      int createAt =
                          int.tryParse(putController.creatAt.text) ?? 0;
                      putController.putData(
                          id: putController.id.text,
                          createdAt: createdAt,
                          name: putController.name.text,
                          avatar: putController.avatar.text,
                          creatAt: createAt,
                          context: context);
                    },
                    child: const Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
