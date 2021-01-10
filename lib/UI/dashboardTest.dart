import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/DashboardPage.dart';
import 'Drawer/Mydrawer.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class Dashboard extends StatefulWidget {

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Tech Learn',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 24.0, color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.white54,
            )
          ],
        ),
      body:
          Container(
    child: Column(
      children: <Widget>[
    SizedBox(height: 50,),
          Padding(padding:EdgeInsets.only(left: 16, top: 10,right: 16),

            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome To TechLearn",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
                  SizedBox(height: 4,),
                  Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),




                ],
              ),
              IconButton(
                alignment: Alignment.topCenter,
                icon: Image.asset('images/notification.png',width: 30,),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
              )
            ],
          ),
          ),

          SizedBox(height: 70,
          ),
          GridDashboard(),

    ]),
         ),

      drawer: Mydrawer(),

    );

  }
  }


class Notifications extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Notifications> {



  @override
  Widget build(BuildContext context) {
    return  MessagingWidget();

  }

}

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((value) => print(value));
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
        messages.add(Message(
        title: notification['title'], body: notification['body']));
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
        messages.add(Message(
        title: '${notification['title']}',
        body: '${notification['body']}',
        ));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) =>
      ListView(
        children: messages.map(buildMessage).toList(),
      );

  Widget buildMessage(Message message) =>
      ListTile(
        title: Text(message.title),
        subtitle: Text(message.body),
      );

}
@immutable
class Message {
  final String title;
  final String body;

  const Message({
    @required this.title,
    @required this.body,
  });
}