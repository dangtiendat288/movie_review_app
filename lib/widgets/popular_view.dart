import 'package:flutter/material.dart';
import 'package:movie_review_app/api/api_services.dart';
import 'package:movie_review_app/models/popular_movie.dart';
import 'package:movie_review_app/views/detail_screen.dart';
import 'package:movie_review_app/widgets/movie_item.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<Results>>(
        future: ApiServices().getResults(),
        builder: (context, snapshot){
          if(snapshot.hasError||!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Results> movieList = snapshot.data!;
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.62,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 30,
            ),
            itemCount: movieList.length,
            itemBuilder: (context,index){
              return itemPopular(
                  onPressed: (){
                var route = MaterialPageRoute(builder: (BuildContext context) => DetailScreen(movieItem: movieList[index]));
                Navigator.push(context,route);
              },
              results: movieList[index]);
            },
          );
        },
      ),
    );
  }
}
