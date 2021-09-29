import 'dart:convert';

import 'package:http/http.dart' as _http;
import 'package:petapp/feature/movielist/movielistresponse/alllist_response.dart';
import 'package:petapp/networking/api_endpoints.dart';
import 'package:petapp/networking/app_config.dart';

class ApiClient {
  var http = new _http.Client();

  Future<List<AllListResponse>> getMovieList(String getMovie) async {
    Map<String, String> queryParams = {
      'api_key': '83d01f18538cb7a275147492f84c3698'
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = AppConfig.instance.apiBaseUrl +
        "/movie" +
        getMovie +
        '?' +
        queryString; // result - https://www.myurl.com/api/v1/user?param1=1&param2=2
    var response = await http.get(Uri.parse(requestUrl));

    try {
      if (response.statusCode == 200) {
        var rb = response.body;

        // store json data into list

        final List<dynamic> parsed = jsonDecode(rb);
        return parsed.map((json) => AllListResponse.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load list');
      }
    } catch (e) {
      throw Exception('$e ');
    }
  }
}
