import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Text("Home"),
      ),
      // body: Padding(
      //   padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 35),
      //   child: postController.isloading.value
      //       ? CircularProgressIndicator()
      //       : StaggeredGridView.countBuilder(
      //           staggeredTileBuilder: (index) =>
      //               index % 2 != 0 && index % 3 == 0
      //                   ? StaggeredTile.count(2, 2)
      //                   : StaggeredTile.count(1, 1),
      //           mainAxisSpacing: 8,
      //           crossAxisSpacing: 8,
      //           crossAxisCount: 3,
      //           itemCount: postController.allpost.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               color: Colors.white,
      //               elevation: 0.0,
      //               margin: EdgeInsets.zero,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //               child: Container(
      //                 margin: EdgeInsets.all(8),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(8),
      //                   // child: Container(
      //                   //   color: Colors.red,
      //                   // ),
      //                   child: Image.network(
      //                     postController.allpost[index].thumbnail,
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      // ),
    ));
  }
}
