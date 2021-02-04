import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference studentCollection = Firestore.instance.collection('students');
//student collection
  Future updateStudentData(String firstName,String lastName,String email) async{
    return await studentCollection.document(uid).setData({
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
    });
  }
  //collection reference

  final CollectionReference teacherCollection = Firestore.instance.collection('teachers');
//teacher collection

  Future updateTeacherData(String firstName,String lastName,String email) async{
    return await teacherCollection.document(uid).setData({
      'firstName':firstName,
      'lastName':lastName,
      'email':email,


    });
  }
  //get tech stream
Stream<QuerySnapshot> get teacher{
    return teacherCollection.snapshots();
}
}