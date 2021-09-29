import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:petapp/feature/movielist/movielistresponse/alllist_response.dart';
import 'package:petapp/feature/movielist/movielistresponse/baselist_response.dart';
import 'package:petapp/feature/movielist/movielistviewmodel/movieListViewModel.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late List<AllListResponse> items;

  bool isLoading = false;

   late Future<List<AllListResponse>> futureData;

  void loadMovieListFuture() {
   futureData  =   MovieListViewModel().fetchMovieList();
    setState(() {});
  }

  @override
  void initState() {
    loadMovieListFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text("Networking Example"),
          ),
          body: Center(child: buildDataWidget()),
          floatingActionButton: FloatingActionButton(
            child: isLoading
                ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : Icon(Icons.cloud_download),
            tooltip: "Get Data from API",
            onPressed: () => loadMovieListFuture(),
          ),
        )));
  }

  void getDataFromAPI() async {
    setState(() {
      isLoading = true;
    });
  }

  Widget buildBody(BuildContext ctxt, int position) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                  child: Text(
                    items[position].results.first.title,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                  child: Text(
                    items[position].results.first.title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "5m",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.star_border,
                      size: 35.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          height: 2.0,
          color: Colors.grey,
        )
      ],
    );
  }

  buildDataWidget() {

    FutureBuilder<List<AllListResponse>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            items = snapshot.requireData;
            return ListView.builder(
              itemBuilder: (BuildContext context, int position) =>
                  buildBody(context, position),
              itemCount: items.length,
            );
          } else {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
        });
  }
}
