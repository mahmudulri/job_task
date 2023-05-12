import 'package:flutter/material.dart';
import 'package:job_task/home_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_task/pages/explore.dart';
import 'package:job_task/pages/inbox.dart';
import 'package:job_task/pages/shop.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    Explore(),
    Inbox(),
    Shop(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 0.0,
        notchMargin: 10,
        child: Container(
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeView();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: currentIndex == 0
                              ? Color(0xffF15223)
                              : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: GoogleFonts.dmSans(
                            color: currentIndex == 0
                                ? Color(0xffF15223)
                                : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Explore();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.explore,
                          color: currentIndex == 1
                              ? Color(0xffF15223)
                              : Colors.grey,
                        ),
                        Text(
                          "Explore",
                          style: GoogleFonts.dmSans(
                            color: currentIndex == 1
                                ? Color(0xffF15223)
                                : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Inbox();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: currentIndex == 2
                              ? Color(0xffF15223)
                              : Colors.grey,
                        ),
                        Text(
                          "Inbox",
                          style: GoogleFonts.dmSans(
                            color: currentIndex == 2
                                ? Color(0xffF15223)
                                : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Shop();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: currentIndex == 3
                              ? Color(0xffF15223)
                              : Colors.grey,
                        ),
                        Text(
                          "Shop",
                          style: GoogleFonts.dmSans(
                            color: currentIndex == 3
                                ? Color(0xffF15223)
                                : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
