import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/Levels.dart';

class GridviewPage extends StatefulWidget {
  @override
  _GridviewPageState createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  @override
  Widget build(BuildContext context) {}
}

class GridDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 18),
        children: <Widget>[
          InkWell(
            child: GridTile(
                child: Image.asset('images/calendar.png'),
                footer: Container(
                  height: 20,
                  color: Colors.black.withOpacity(0.1),
                  child: Text(
                    "Calender",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
            onTap: () {},
          ),
          InkWell(
            child: GridTile(
                child: Image.asset('images/pr.png'),
                footer: Container(
                  height: 20,
                  color: Colors.black.withOpacity(0.1),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
            onTap: () {},
          ),
          InkWell(
            child: GridTile(
                child: Image.asset('images/levels.jpg'),
                footer: Container(
                  height: 20,
                  color: Colors.black.withOpacity(0.1),
                  child: Text(
                    "Levels",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LevelPage()));
            },
          ),
          InkWell(
            child: GridTile(
                child: Image.asset('images/notification.png'),
                footer: Container(
                  height: 20,
                  color: Colors.black.withOpacity(0.1),
                  child: Text(
                    "Activity",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
            onTap: () {},
          ),
          InkWell(
            child: GridTile(
                child: Image.asset('images/todo.png'),
                footer: Container(
                  height: 20,
                  color: Colors.black.withOpacity(0.1),
                  child: Text(
                    "To Do",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
            onTap: () {},
          ),
          InkWell(
            child: GridTile(
                child: Image.asset('images/setting.png'),
                footer: Container(
                  height: 20,
                  color: Colors.black.withOpacity(0.1),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}
