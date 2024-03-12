import 'package:api_all/controller/post_controller.dart';
import 'package:api_all/screens/put_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

final PostController postController = Get.put(PostController());

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,

          backgroundColor: Colors.cyan,
          title: const Text("POST"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PutScreen(),
                      ));
                },
                icon: const Icon(Icons.arrow_forward))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                      hintText: ' Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  controller: postController.descrition,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'StartTime',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  controller: postController.StartTime,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'EndTime',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  controller: postController.EndTime,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      postController.PostData(
                          context: context,
                          userId: 1702558544461,
                          groupId: 1690029743650,
                          description: postController.descrition.text,
                          startTime: postController.StartTime.text,
                          endTime: postController.EndTime.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        fixedSize: const Size(500, 50.0)),
                    child: const Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
