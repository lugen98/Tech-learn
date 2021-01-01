

import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/Levels.dart';

class GridviewPage extends StatefulWidget {
  @override
  _GridviewPageState createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  @override
  Widget build(BuildContext context) {
  }

}
class GridDashboard extends StatelessWidget {

  Items item1 = new Items(
    title: "Calendar",
    subtitle: "December,Sunday",
    event: "2 Event",
    img: 'images/calendar.png',
  );

  Items item2 = new Items(
    title: "Profile",
    subtitle: "View",
    event: "",
    img: 'images/p.jpg',
  );

  Items item3 = new Items(
      title: "Levels",
      subtitle: "Class",
      event: "4 Items",
      img: 'images/levels.jpg'
  );

  Items item4 = new Items(
    title: "Activity",
    subtitle: "Classes",
    event: "",
    img: 'images/notification.png',
  );

  Items item5 = new Items(
    title: "To Do",
    subtitle: "Homework",
    event: "2 Event",
    img: 'images/todo.png',
  );

  Items item6 = new Items(
    title: "Settings",
    subtitle: "",
    event: "",
    img: 'images/setting.png',

  );


  @override
  Widget build(BuildContext context) {
    List <Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder:(context ) =>LevelPage()
            ));
          },
          child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,

              children: myList.map((data) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Image.asset(
                          data.img,
                          width: 45,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          data.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          data.subtitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 14,),
                        Text(
                          data.event,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),

                );
              }).toList()),
        )
    );
  }

}
class Items{
  String title;
  String subtitle;
  String event;
  String img;

  Items({this.title,this.subtitle,this.event,this.img});


}
