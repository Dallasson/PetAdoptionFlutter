


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




}