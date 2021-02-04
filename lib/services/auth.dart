import 'package:firebase_auth/firebase_auth.dart';
import 'package:techlearning_app/services/database.dart';
import 'package:techlearning_app/services/users.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj baser on FirebaseUser
  User _userFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

// auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFirebase);
  }


  //sing in Google
    Future<void> signInGoogle() async{
        try {
        GoogleSignInAccount  signInAccount = await GoogleSignIn().signIn();
        GoogleSignInAuthentication authentication = await signInAccount.authentication;
        var x = GoogleAuthProvider.getCredential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken,
        );
          AuthResult result = await _auth.signInWithCredential(x);
        FirebaseUser user = result.user;
        return _userFirebase(user);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in student emil $ pass
  Future signInStudentEP(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in teacher emil $ pass
  Future signInTeacherEP(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  // Student register in emil $ pass
  Future studentRegisterEP(String firstName,String lastName,String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for the new user with uid
      await DatabaseService(uid: user.uid).updateStudentData(firstName, lastName,email);
      return _userFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // Teacher register in emil $ pass
  Future teacherRegisterEP(String firstName,String lastName,String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for the new user with uid
      await DatabaseService(uid: user.uid).updateTeacherData(firstName, lastName, email);
      return _userFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

}
