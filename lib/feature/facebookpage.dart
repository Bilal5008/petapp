import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FaceBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("facebook"),
                Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15),
                    Icon(Icons.messenger_outlined)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home),
                    Icon(Icons.perm_contact_calendar_rounded),
                    Icon(Icons.play_circle_outline_sharp),
                    Icon(Icons.cases),
                    Icon(Icons.notifications_active_outlined),
                    Icon(Icons.article_outlined),
                  ],
                ),
                SizedBox(height: 12),
                Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Divider(
                      height: 2,
                      thickness: 1,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg"),
                ),
                SizedBox(width: 12),
                Expanded(
                    child: Container(
                  height: 35,
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                )),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(2.0),
              child: Divider(
                height: 2,
                thickness: 1,
              )),
          _tabSection(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: storyLine(context),
          )
        ],
      )),
    );
  }

  _tabSection() {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.black, width: 1.0),
            left: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
        tabs: [
          Row(
            children: [
              Icon(Icons.home),
              SizedBox(width: 10),
              Text(
                "Live",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.home),
              SizedBox(width: 10),
              Text(
                "Live",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.home),
              SizedBox(width: 10),
              Text(
                "Live",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget storyLine(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: Colors.red,
              width: 100,
              margin: EdgeInsets.all(20),
              child: Image.network(
                  "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",   fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,),

            ),
          );
          // return Container(
          //   decoration: ShapeDecoration(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(10),
          //
          //
          //       ),
          //     ),
          //   ),
          //     padding: EdgeInsets.symmetric(horizontal: 8.0),
          child:
          Image.network(
              "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg");
          // );
        },
      ),
    );
  }
}
