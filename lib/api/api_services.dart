import 'package:movie_review_app/api/api_source.dart';
import 'package:movie_review_app/models/cast_item.dart';
import 'package:movie_review_app/models/popular_movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServices{
  Future<List<Results>> getResults() async {
    List<Results> movieList = [];
    final apiLink = ApiSource().VIDEO_URL;

    var response = await http.get(apiLink);
    print("LOG: " + response.body.toString());

    var body = json.jsonDecode(response.body);
    if(body['page']== 1){
      List jsonList = body['results'];
      print("LOG: " + jsonList.toString());
      for(var jsonItem in jsonList){
        Results results = Results.fromJson(jsonItem);
        movieList.add(results);
      }
      // print("LOG: " + movieList.toString());
    }

    else throw Exception("FAIL_VIDEO_FETCHING");
    return movieList;
  }

  static Future<List<CastItem>> getCastItems(String castItemUri) async {
    List<CastItem> castList = [];
    final CAST_URL = Uri.parse(castItemUri);
    var response = await http.get(CAST_URL);
    // print("LOG: " + response.body.toString());

    var body = json.jsonDecode(response.body);
    if(body['id'] != null){
      List jsonList = body['cast'];
      // print("LOG: " + jsonList.toString());
      for(var jsonItem in jsonList){
        CastItem castItem = CastItem.fromJson(jsonItem);
        castList.add(castItem);
      }
      print("LOG: " + castList.toString());
    }

    else throw Exception("FAIL_VIDEO_FETCHING");
    return castList;
  }
}