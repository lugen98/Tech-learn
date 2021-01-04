import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/services/auth.dart';
import 'Login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechLearn',
      theme: ThemeData(
        primaryColor: Color(0xff659bdb),
        accentColor: Color(0xffb9d4f8),
        primaryColorDark: Color(0xff1b4a9a),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'SingUp'),
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
      appBar: AppBar(
        title: Text('Register'),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.2,
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
                  MaterialPageRoute(builder: (context) => Dashboard()));
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
  final AuthService _auth = AuthService();

  bool isHidePassword = false;

  TextEditingController _firstName = new TextEditingController();
  TextEditingController _lastName = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
              ),
              firstName(),
              lastName(),
              getEmail(),
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
            onPressed: () async {
              if (_firstName.text.isEmpty) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Please Enter UserName"),
                ));
              } else if (_password.text.isEmpty) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Please Enter Password"),
                ));

                dynamic result = await _auth.SignInAnon();
                if (result == null) {
                  print('error Signing in');
                } else {
                  print('signed in');
                  print(result.uid);
                }
              }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));

            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffff38f1), Color(0xffba00ff)],
                    stops: [0, 1],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          Column(children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: openLoginPage,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            )
          ])
        ]));
  }

  TextFormField getPassword() {
    return TextFormField(
      onChanged: (val) {},
      controller: _password,
      keyboardType: TextInputType.text,
      obscureText: !isHidePassword,
      decoration: InputDecoration(
        hintText: 'password',
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

  TextFormField getEmail() {
    return TextFormField(
      onChanged: (val) {

      },
      controller: _email,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'E-Mail',
      ),
    );
  }

  TextFormField firstName() {
    return TextFormField(
      onChanged: (val) {},
      controller: _firstName,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'First Name',
      ),
    );
  }

  TextFormField lastName() {
    return TextFormField(
      onChanged: (val) {},
      controller: _lastName,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Last Name',
      ),
    );
  }

  void _togglePasswordVisability() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  void openLoginPage() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
}
