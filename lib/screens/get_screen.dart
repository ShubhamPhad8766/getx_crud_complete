// ignore_for_file: prefer_is_empty, avoid_unnecessary_containers, use_super_parameters

import 'package:api_all/controller/get_controller.dart';
import 'package:api_all/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({Key? key}) : super(key: key);

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  final GetController getController = Get.put(GetController());

  @override
  void initState() {
    getController.getData(context);
    Future.delayed(
      Duration(seconds: 10),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,

          title: const Text("GET"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostScreen(),
                      ));
                },
                icon: const Icon(Icons.arrow_forward))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Obx(() => getController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : getController.getModel.data?.length == 0
                      ? const Text("Data Not Found")
                      : Expanded(
                          child: ListView.builder(
                            itemCount: getController.getModel.data!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.cyan,
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getController.getModel
                                                  .data![index].approvedBy
                                                  .toString(),
                                            ),
                                            Text(
                                              getController.getModel
                                                  .data![index].approver
                                                  .toString(),
                                            ),
                                            Text(
                                              getController.getModel
                                                  .data![index].createdAt
                                                  .toString(),
                                            ),
                                            Text(
                                              getController.getModel
                                                  .data![index].desperation
                                                  .toString(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
