import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:petapp/feature/moviedetail/moviedetailscreen.dart';
import 'package:petapp/feature/movielist/movielistresponse/alllist_response.dart';
import 'package:petapp/feature/movielist/movielistviewmodel/movieListViewModel.dart';
import 'package:petapp/Common/routes.dart' as route;

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late TextEditingController _editingController;

  @override
  void initState() {
    loadMovieListFuture();
    _editingController = TextEditingController();
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
  void dispose() {
    _editingController.dispose();
    super.dispose();
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
          body: Container(
              child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: buildSearchLayoutWidget(),
              ),
              Expanded(
                flex: 8,
                child: buildDataWidget(),
              ),
            ],
          )),
        )));
  }

  void getDataFromAPI() async {
    setState(() {
      isLoading = true;
    });
  }

  Widget buildBody(BuildContext ctxt, int position, AllResponse data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
            child: cardImageWidget(data, position)),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
          child: Text(
            data.results![position].originalTitle!,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
          child: Text(
            data.results![position].overview!,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
          child: Text(
            data.results![position].popularity.toString(),
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widgetIcons(),
              widgetIcons(),
              widgetIcons(),
              widgetIcons(),
              widgetIcons(),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
        ),
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

  Widget buildSearchLayoutWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(4.0, 2.0, 3.0, 0.0),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Search Movies",
              prefixIcon: IconButton(
                onPressed: () => {},
                icon: Icon(Icons.search),
              ),
            ),
            textAlign: TextAlign.left,
            onSubmitted: (newValue) {
              setState(() {});
            },
            autofocus: true,
            controller: _editingController,
          )),
    );
  }

  Widget cardImageWidget(AllResponse data, int position) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route.Routes.routeName2,
            arguments: data.results![position]);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return MovieDetailScreen(data.results![position]);
        //   }),
        // );
        // Navigator.pushNamed(context, MovieDetailScreen.routeName, arguments: MovieDetailScreen( data.results![position]));
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 5,
          ),
        ),
        child: Container(
          child: Image.network("http://image.tmdb.org/t/p/w500" +
              data.results![position].posterPath.toString()),
        ),
      ),
    );
  }

  widgetIcons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Icon(Icons.weekend_outlined), Text("Vote")],
    );
  }
}
