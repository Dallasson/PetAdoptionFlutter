


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;


  Future<UserCredential?> loginUser(String email , String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential?> registerUser(String email,String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }


  Future<bool> uploadUser(String fullName,String phoneNumber,String email) async {

    try {

      var userUid = _firebaseAuth.currentUser!.uid;

      var map = {
        "fullName" : fullName,
        "phoneNumber" : phoneNumber,
        "email" : email,
        "userUid" : userUid
      };

      _firebaseDatabase.ref().child("Users").child(userUid).set(map);
      return true;

    } catch(e){
      return false;
    }

  }


}