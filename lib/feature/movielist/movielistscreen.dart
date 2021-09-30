import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:petapp/feature/movielist/movielistresponse/alllist_response.dart';
import 'package:petapp/feature/movielist/movielistviewmodel/movieListViewModel.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  void initState() {
    loadMovieListFuture();
    super.initState();
  }

  late AllResponse items;

  bool isLoading = false;

  Future<AllResponse> loadMovieListFuture() {
    setState(() {
      print('working');
    });
    return MovieListViewModel().fetchMovieList();
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
          body: buildDataWidget(),
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

  Widget buildBody(BuildContext ctxt, int position, AllResponse data) {
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
                    data.results![position].title!,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                  child: Text(
                    data.results![position].title!,
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

  Widget buildDataWidget() {
    return FutureBuilder<AllResponse>(
        future: loadMovieListFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('${snapshot.data!.results!.length} this is length');
            return ListView.builder(
              itemBuilder: (BuildContext context, int position) =>
                  buildBody(context, position, snapshot.data!),
              itemCount: snapshot.data!.results!.length,
            );
          } else {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
        });
  }
}
