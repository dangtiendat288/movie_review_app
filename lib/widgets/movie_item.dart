import 'package:flutter/material.dart';
import 'package:movie_review_app/models/popular_movie.dart';

Widget itemPopular({onPressed, Results? results}) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      children: [
        //Image
        Expanded(
          flex: 4,
          child: Container(
              decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500" + results!.posterPath!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(18),
            color: Colors.transparent,
          )),
          // child: Image.network("https://image.tmdb.org/t/p/w500" +
          //     results!.posterPath!,
          //   fit: BoxFit.cover,
          // ),
        ),
        //Text
        Expanded(
          flex: 1,
          child: Center(
            child: Text(results.originalTitle!),
          ),
        ),
      ],
    ),
  );
}
