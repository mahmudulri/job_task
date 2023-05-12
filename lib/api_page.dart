import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'controller.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (index) => index % 8 == 0
              ? StaggeredTile.count(1, 1)
              : StaggeredTile.count(2, 1),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
          itemCount: postController.allpost.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.red,
                  ),
                  // child: Image.network(
                  //   postController.allpost[index].thumbnail,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
