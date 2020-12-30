import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/homeScreen.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/techlearnproject_app/lib/UI/dashboardTest.dart';

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Color(0xffb9d4f8),
        primaryColorDark: Color(0xff1b4a9a),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.withOpacity(0.5),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainHomePage()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  bool isHidePassword = false;
  TextEditingController _userName = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, top: 60, right: 20,bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("images/img.png"),
              getUserName(),
              getPassword(),
              logInButton(context),
            ],
          ),
        ));
  }


  Padding logInButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
      child: Column(children: <Widget>[
         RaisedButton(
          onPressed: () {
            if (_userName.text.isEmpty) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Please Enter UserName"),
              ));
            } else if (_password.text.isEmpty) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Please Enter Password"),
              ));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>Dashboard()));
            }
          },
          child: Container(
             height: 50,
             decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [Color(0xffff38f1), Color(0xffba00ff)],
                   stops: [0,1],
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(15))
             ),
               child: Center(
                 child: Text("Log In",
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.w600,
                     fontSize: 24
                 ),),
               ),
             ),
           ),


    ]
      )
    );
  }

  TextFormField getPassword() {
    return TextFormField(
      controller: _password,
      keyboardType: TextInputType.text,
      obscureText: !isHidePassword,
      decoration: InputDecoration(
        labelText: 'password',
        icon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: isHidePassword ? Colors.blue : Colors.grey,
          ),
          onPressed: () {
            _togglePasswordVisability();
          },
        ),
      ),
    );
  }

  TextFormField getUserName() {
    return TextFormField(
      controller: _userName,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'UserName',
      ),
    );
  }

  void _togglePasswordVisability() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }
  void openDetailsPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));

  }
}
