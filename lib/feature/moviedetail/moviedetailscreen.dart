import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/feature/movielist/movielistresponse/alllist_response.dart';

class
MovieDetailScreen extends StatelessWidget {


 final  Result result;
  const MovieDetailScreen( {
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('MovieDetail')),
        body: widgetMovieDetails(result),
      ),
    );
  }
}

Widget widgetMovieDetails(Result result) {
  return SingleChildScrollView(
    child: Container(
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
              child: Image.network("http://image.tmdb.org/t/p/w500/"+ result.posterPath.toString()),
            ),
          ),
          Container(
            child: Padding(
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
          )
        ],
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
