import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home), text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.notifications),
                  text: 'Notification',
                ),
                Tab(
                  icon: Icon(Icons.menu),
                  text: 'Menu',
                ),

              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}
