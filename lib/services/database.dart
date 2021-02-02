import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference techCollection = Firestore.instance.collection('users');


  final CollectionReference studentCollection = Firestore.instance.collection('students');
//student collection
  Future updateStudentData(String firstName,String lastName) async{
    return await studentCollection.document(uid).setData({
      'firstName':firstName,
      'lastName':lastName,

    });
  }

  final CollectionReference teacherCollection = Firestore.instance.collection('teachers');

  Future updateTeacherData(String firstName,String lastName,String email,String password) async{
    return await teacherCollection.document(uid).setData({
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'password':password,

    });
  }
  //get tech stream
Stream<QuerySnapshot> get teacher{
    return teacherCollection.snapshots();
}
}