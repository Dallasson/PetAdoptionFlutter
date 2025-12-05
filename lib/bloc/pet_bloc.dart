

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet/bloc/bloc_event.dart';
import 'package:pet/bloc/bloc_state.dart';
import 'package:pet/services/firebase_service.dart';

class PetBloc extends Bloc<BlocEvent,BlocState> {

  final FirebaseService firebaseService;
  PetBloc(this.firebaseService) : super(INITIAL()){


  }

  void loginUser(LoginEvent event,Emitter<BlocState> emit) async {

    try {
      LOADING(true);
      UserCredential? userCredentials = await firebaseService.loginUser(event.email!, event.password!);
      if(userCredentials!.user != null){
        LoginState(userCredentials);
      } else {
        LoginState(null);
      }
      } catch(e){
         LOADING(false);
      }

  }

  void registerUser(RegisterEvent event,Emitter<BlocState> emit) async {

    try {
      LOADING(true);
      UserCredential? userCredentials = await firebaseService.registerUser(event.email!, event.password!);
      if(userCredentials!.user != null){
        RegisterState(userCredentials);
      } else {
        RegisterState(null);
      }
    } catch(e){
      LOADING(false);
    }

  }

  void uploadUser(UploadUserEvent event,Emitter<BlocState> emit) async {

    var isUploaded = await firebaseService.uploadUser(event.fullName! ,event.phoneNumber!, event.email!);
    UploadUserState(isUploaded);
  }
}