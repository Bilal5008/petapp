import 'dart:convert';

import 'baselist_response.dart';

AllListResponse allListModelFromJson(String str) =>
    AllListResponse.fromJson(json.decode(str));

class AllListResponse {
  late num page;
  late List<BaseListResponse> results;
  late num totalResults;
  late num totalPages;

  AllListResponse(
      {required this.page,
      required this.results,
      required this.totalResults,
      required this.totalPages});

  AllListResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <BaseListResponse>[];
      json['results'].forEach((v) {
        results.add(new BaseListResponse.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['results'] = this.results.map((v) => v.toJson()).toList();
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    return data;
  }
}
