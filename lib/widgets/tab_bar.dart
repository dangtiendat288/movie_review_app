import 'package:flutter/material.dart';

Widget tabBar({controller}){
  return Padding(
    padding: const EdgeInsets.only(top:80,left: 25),
    child: TabBar(
      controller: controller,
      labelStyle: TextStyle(
        fontFamily: "Comfortaa",
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      tabs: [
        Text("Popular"),
        Text("Now Playing"),
        Text("Upcoming"),
        Text("Top Rate"),
      ],
      indicatorColor: Colors.black,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
      labelPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black.withOpacity(0.5),
      isScrollable: true,
    ),
  );

}