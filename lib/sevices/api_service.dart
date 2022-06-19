import 'package:flutter_codigo5_movieapp/models/cast_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo5_movieapp/models/review_model.dart';
import 'package:flutter_codigo5_movieapp/pages/movie_detail_page.dart';
import 'package:flutter_codigo5_movieapp/utils/constans.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/cast_detail_model.dart';
import '../models/genre_model.dart';
import '../models/image_model.dart';
import '../models/movie_model.dart';

class APIService {
  Future<List<MovieModel>> getMovies() async {
    String path = "$pathProduction/discover/movie?api_key=$apiKey";
    print(path.toString());
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List movies = myMap["results"];
      List<MovieModel> movieList =
          movies.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();

      print(movies[0]['original_title']);
      print(movieList[1].title);
      return movieList;
    }
    return [];
  }

  Future<MovieDetailModel?> getMovie(int movieId) async {
    String path = "$pathProduction/movie/$movieId?api_key=$apiKey";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      //print(myMap);

      return MovieDetailModel.fromJson(myMap);
    }
    return null;
  }

  Future<List<CastModel>> getCast(int movieId) async {
    String path =
        "$pathProduction/movie/$movieId/credits?api_key=$apiKey&language=en-US";

    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List cast = myMap["cast"];
      List<CastModel> castModelList =
          cast.map((e) => CastModel.fromJson(e)).toList();
      return castModelList;
    }
    return [];
  }

  Future<List<ReviewModel>> getReviews(int movieId) async {
    String path =
        "$pathProduction/movie/$movieId/reviews?api_key=$apiKey&language=en-US&page=1";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List results = myMap["results"];
      List<ReviewModel> reviews =
          results.map((e) => ReviewModel.fromJson(e)).toList();
      return reviews;
    }
    return [];
  }

  Future<CastDetailModel?> getCastDetail(int castId) async {
    String path = "$pathProduction/person/$castId?api_key=$apiKey";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      CastDetailModel castDetailModel = CastDetailModel.fromJson(myMap);
      return castDetailModel;
    }
    return null;
  }

  Future<List<ImageModel>> getImages(int movieId) async {
    String path = "$pathProduction/movie/$movieId/images?api_key=$apiKey";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List images = myMap["backdrops"];
      List<ImageModel> imageModelList =
          images.map((e) => ImageModel.fromJson(e)).toList();
      return imageModelList;
    }
    return [];
  }

  Future<List<GenreModel>> getGenres() async {
    String path =
        "$pathProduction/genre/movie/list?api_key=$apiKey&language=en-US";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List genres = myMap["genres"];
      List<GenreModel> genreModelList =
          genres.map((e) => GenreModel.fromJson(e)).toList();
      return genreModelList;
    }
    return [];
  }
}
