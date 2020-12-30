import 'package:flutter/material.dart';
import '../dashboardTest.dart';
import 'editProfile.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _profileText() {
    return Padding(
        padding: const EdgeInsets.all(50.0),
    child:SingleChildScrollView(

    child: Text(
        'Profile',
        style: TextStyle(
          fontSize: 35.0,
          letterSpacing: 1.5,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),

    )
    )

    );
  }

 /* Widget _circleAvatar() {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.width / 3,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/user.png'),
        ),
      ),
    );
  }
*/
  Widget _textFormField({
    String hintText,
    IconData icon,
  }) {
    return Material(


        elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            prefixIcon: Icon(icon,color: Theme.of(context).primaryColor,),
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            filled: true,
            fillColor: Colors.white30),
      ),

    );
  }

  Widget _textFormFieldCalling() {
    return Container(
      height: 420,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _textFormField(
            hintText: 'First Name',
            icon: Icons.person,
          ),

          _textFormField(
            hintText: 'Last Name',
            icon: Icons.person,

          ),

        
          _textFormField(
            hintText: 'E-mail',
            icon: Icons.mail,

          ),
          _textFormField(hintText: 'Password', icon: Icons.lock),
          _textFormField(
            hintText: 'Contact Number',
            icon: Icons.phone,
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Center(


                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Your Profile Updated"),));},
            ),

          )
        ],
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Dashboard()));
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {  Navigator.push(
                context, MaterialPageRoute(builder: (context) => EditProfilePage()));},
            icon: Text(
              "Edit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              child:SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
    crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _profileText(),
             // _circleAvatar(),
              _textFormFieldCalling()
            ],
          ),
        ],
      ),
    );
  }
}
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff6361f3);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 200.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

