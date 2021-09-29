import 'package:flutter/cupertino.dart';
import 'package:petapp/feature/movielist/movielistresponse/alllist_response.dart';
import 'package:petapp/networking/apiclient.dart';

class MovieListViewModel extends ChangeNotifier {
  ApiClient _api = ApiClient();

  Future<List<AllListResponse>> fetchMovieList() async {
    return await _api.getMovieList("/popular");
  }
}
