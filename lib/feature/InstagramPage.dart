import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'movielist/movielistresponse/alllist_response.dart';
import 'movielist/movielistviewmodel/movieListViewModel.dart';

class InstagramPage extends StatefulWidget {
  @override
  _InstagramPageState createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage> {
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
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Instagram"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: iconWidgets(),
                ),
              ),
            ],
          ),
          buildStoryLine(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Instagram"),
              ],
            ),
          ),
          Expanded(
            flex: MediaQuery.of(context).size.height.toInt(),
            child: buildDataWidget(),
          ),
          Spacer(),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
          ),
        ]),
      ),
    );
  }

  buildListDataWidget() {
    return FutureBuilder<AllResponse>(
        future: loadMovieListFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('${snapshot.data!.results!.length} this is length');
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  itemBuilder: (BuildContext context, int position) =>
                      buildBody(context, position, snapshot.data!),
                  itemCount: snapshot.data!.results!.length,
                ),
              ],
            );
          } else {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
        });
  }

  buildDataWidget() {
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

  Widget buildBody(BuildContext ctxt, int position, AllResponse data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        cardImageWidget(data, position),
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
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}

buildListDataWidgetNew(AllResponse data, int position) {
  return Expanded(
    child: Container(
      color: Colors.red,
      child: ListView.builder(
        padding: const EdgeInsets.all(7.0),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Image.network("http://image.tmdb.org/t/p/w500" +
              data.results![position].posterPath.toString());
        },
      ),
    ),
  );
}

Widget buildStoryLine(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: storyLine(context),
  );
}

Widget cardImageWidget(AllResponse data, int position) {
  return InkWell(
    onTap: () {
      // Navigator.pushNamed(context, route.Routes.routeName2,
      //     arguments: data.results![position]);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) {
      //     return MovieDetailScreen(data.results![position]);
      //   }),
      // );
      // Navigator.pushNamed(context, MovieDetailScreen.routeName, arguments: MovieDetailScreen( data.results![position]));
    },
    child: Card(
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

Widget iconWidgets() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.access_alarm),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.access_alarm),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.access_alarm),
        SizedBox(
          width: 10,
        ),
      ],
    ),
  );
}

Widget storyLine(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    height: MediaQuery.of(context).size.height * 0.1,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: CircleAvatar(
            radius: 27,
            backgroundImage: NetworkImage(
                "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg"),
          ),
        );
      },
    ),
  );
}
