import 'package:flutter/material.dart';
import 'package:movie_review_app/widgets/popular_view.dart';

Widget tabBarView({controller}){
  return Expanded(
      child: TabBarView(
      controller: controller,
        children: [
          PopularView(),
          Container(),
          Container(),
          Container(),
        ],
      ),
  );
}