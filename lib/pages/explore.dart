import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller.dart';
import 'dart:ui';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    PostController postController = Get.put(PostController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Container(
              height: screenHeight * 0.070,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF4F5F7),
                // color: Colors.green,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.search,
                      size: screenWidth * 0.080,
                      color: Color(0xff040415),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search in Swipexyz..",
                        hintStyle: GoogleFonts.dmSans(
                          color: Color(0xff040415),
                          fontSize: screenWidth * 0.050,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 35),
              child: postController.isloading.value
                  ? Center(child: CircularProgressIndicator())
                  : StaggeredGridView.countBuilder(
                      staggeredTileBuilder: (index) =>
                          index % 2 != 0 && index % 3 == 0
                              ? StaggeredTile.count(2, 2)
                              : StaggeredTile.count(1, 1),
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 3,
                      itemCount: postController.allpost.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Card(
                                                color: Colors.white,
                                                elevation: 0.0,
                                                margin: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  margin: EdgeInsets.all(5),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    // child: Container(
                                                    //   color: Colors.red,
                                                    // ),
                                                    child: Image.network(
                                                      postController
                                                          .allpost[index]
                                                          .thumbnail,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Saber Ali",
                                                    style: GoogleFonts.dmSans(
                                                      fontSize:
                                                          screenWidth * 0.035,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Dhaka, Bangladesh",
                                                    style: GoogleFonts.dmSans(
                                                      fontSize:
                                                          screenWidth * 0.030,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.person_add,
                                                color: Colors.red,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              Text(
                                                "Follow",
                                                style: GoogleFonts.dmSans(
                                                  color: Colors.red,
                                                  fontSize: screenWidth * 0.035,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20.0),
                                        Card(
                                          color: Colors.white,
                                          elevation: 0.0,
                                          margin: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Container(
                                            height: 250,
                                            width: screenWidth,
                                            margin: EdgeInsets.all(8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              // child: Container(
                                              //   color: Colors.red,
                                              // ),
                                              child: Image.network(
                                                postController
                                                    .allpost[index].thumbnail,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20.0),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: screenWidth,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xffF4F5F7),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "View Post",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 0.0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                // child: Container(
                                //   color: Colors.red,
                                // ),
                                child: Image.network(
                                  postController.allpost[index].thumbnail,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    ));
  }
}
