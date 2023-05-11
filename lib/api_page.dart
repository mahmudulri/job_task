import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());
    return SafeArea(
        child: Scaffold(
      body: postController.isloading.value
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: postController.allpost.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(postController.allpost[index].title),
                    Container(
                      height: 150,
                      width: 150,
                      child: Image.network(
                        postController.allpost[index].thumbnail,
                      ),
                    ),
                  ],
                );
              },
            ),
    ));
  }
}
