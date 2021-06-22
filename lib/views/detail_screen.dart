import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/api/api_services.dart';
import 'package:movie_review_app/models/cast_item.dart';
import 'package:movie_review_app/models/popular_movie.dart';

class DetailScreen extends StatefulWidget {
  var movieItem;

  // const DetailScreen({Key? key}
  DetailScreen({this.movieItem});

  @override
  _DetailScreenState createState() => new _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/original" +
                widget.movieItem.backdropPath,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(
          height: 20,
        ),
        _header(),
        SizedBox(
          height: 20,
        ),
        _cast(),
        SizedBox(
          height: 20,
        ),
        _overview(),
      ],
    );
  }

  Widget _header() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            Container(
                height: 200,
                width: 130,
                alignment: Alignment.center,
                // child: Image.network(
                //   "https://image.tmdb.org/t/p/w500" + widget.movieItem.posterPath,
                //   fit: BoxFit.cover,
                // ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://image.tmdb.org/t/p/w500" + widget.movieItem.posterPath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.transparent,
                ),
            ),
            SizedBox(
              width: 20,
            ),
            //Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movieItem.originalTitle,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Comfortaa",
                  ),
                ),
                Text(
                  "Publish: " + widget.movieItem.releaseDate,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Genre: ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget _cast() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Text(
            "Cast",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 160,
            child: FutureBuilder<List<CastItem>>(
                future: ApiServices.getCastItems(
                    "https://api.themoviedb.org/3/movie/${widget.movieItem.id}/credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN"),
                builder: (context, snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<CastItem> castList = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: castList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _itemcast(itemCast: castList[index]);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _itemcast({CastItem? itemCast}) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: Column(children: [
        //Image
        Expanded(
          child: Container(
            height: 600,
            width: 100,
            // child: Image.network(
            //   "https://image.tmdb.org/t/p/w500/${itemCast!.profilePath}",
            //   fit: BoxFit.cover,
            // ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${itemCast!.profilePath}")),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          flex: 13,
        ),
        SizedBox(
          height: 10,
        ),
        //Actor/actress's name
        Expanded(
          child: Text(
            itemCast.name!,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Text(
            itemCast.character!,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          flex: 1,
        ),
        //Role
      ]),
    );
  }

  Widget _overview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Overview",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.movieItem.overview,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
