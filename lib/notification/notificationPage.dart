import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message.dart';

class Notifications extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return MessagingWidget();
  }
}

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    // _firebaseMessaging.getToken().then((value) => print(value));
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //     final notification = message['notification'];
    //     setState(() {
    //       messages.add(Message(
    //           title: notification['title'], body: notification['body']));
    //     });
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //
    //     final notification = message['data'];
    //     setState(() {
    //       messages.add(Message(
    //         title: '${notification['title']}',
    //         body: '${notification['body']}',
    //       ));
    //     });
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //   },
    // );
    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) => ListView(
        children: messages.map(buildMessage).toList(),
      );

  Widget buildMessage(Message message) => ListTile(
        title: Text(message.title),
        subtitle: Text(message.body),
      );
}
