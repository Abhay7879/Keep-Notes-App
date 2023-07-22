import 'dart:ui';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:keep_notes/SideMenuBar.dart';
import 'package:keep_notes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note =
      "This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note";
  String note1 = "This is a note This is a note This is a note This is a note";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      key: _drawerKey,
      drawer: SideMenu(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _drawerKey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: white,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 55,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Search Your Notes",
                                  style: TextStyle(
                                      color: white.withOpacity(0.5),
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => white.withOpacity(0.1)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ))),
                              onPressed: () {},
                              child: Icon(
                                Icons.grid_view,
                                color: white,
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                NoteSectionAll(),

                /* Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    crossAxisCount: 4,
                    staggeredTileBuilder: ((index) => StaggeredTile.fit(2)),
                    itemBuilder: ((context, index) => Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: index.isEven
                                  ? Colors.green[900]
                                  : Colors.blue[900],
                              border: Border.all(
                                  color: index.isEven
                                      ? Colors.green.withOpacity(0.4)
                                      : Colors.blue.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(7)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Heading",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                index.isEven
                                    ? note.length > 250
                                        ? "${note.substring(0, 250)}...."
                                        : note
                                    : note1,
                                style: TextStyle(color: white),
                              ),
                            ],
                          ),
                        )),
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget NoteSectionAll() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "All",
                style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          child: StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            crossAxisCount: 4,
            staggeredTileBuilder: ((index) => StaggeredTile.fit(2)),
            itemBuilder: ((context, index) => Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: white.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Heading",
                        style: TextStyle(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        index.isEven
                            ? note.length > 250
                                ? "${note.substring(0, 250)}...."
                                : note
                            : note1,
                        style: TextStyle(color: white),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}