import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:petapp/feature/moviedetail/moviedetailscreen.dart';
import 'package:petapp/feature/movielist/movielistresponse/alllist_response.dart';
import 'package:petapp/feature/movielist/movielistviewmodel/movieListViewModel.dart';
import 'package:petapp/Common/routes.dart' as route;

class LayoutPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My application")),
        body: SafeArea(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.account_circle, size: 50),
                      ),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter McFlutter',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              'Flutter developer is there for you',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ]),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.access_alarm),
                      Icon(Icons.access_alarm),
                      Icon(Icons.access_alarm),
                      Icon(Icons.access_alarm),
                      Icon(Icons.access_alarm),
                      Icon(Icons.access_alarm),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Flutter developer ',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        'this is bilal',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
