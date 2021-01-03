import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dashboardTest.dart';



  class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
  }

  class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor:Colors.grey[600],
    appBar: AppBar(
      backgroundColor:Colors.grey[600],
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>Dashboard()));
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    ),
    body: Container(
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Text(
            "Settings",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          buildAccountOptionRow(context, "Change password"),
          buildAccountOptionRow(context, "Content settings"),
          buildAccountOptionRow(context, "Social"),
          buildAccountOptionRow(context, "Language"),
          buildAccountOptionRow(context, "Privacy and security"),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.notifications,
                color: Colors.deepPurple,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Notifications",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          buildNotificationOptionRow("New for you", true),
          buildNotificationOptionRow("Account activity", true),
          buildNotificationOptionRow("Opportunity", true),
          SizedBox(
            height: 50,
          ),

        ],
      ),
    ),
  );
}

Row buildNotificationOptionRow(String title, bool isActive) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
      Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            value: isActive,
            onChanged: (bool val) {},
          ))
    ],
  );
}

GestureDetector buildAccountOptionRow(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Option 1"),
                  Text("Option 2"),
                  Text("Option 3"),
                ],
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close")),
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
}



