

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocState extends Equatable {

}

class LoginState extends BlocState {

  final UserCredential? userCredential;

  LoginState(this.userCredential);

  @override
  List<Object?> get props => [userCredential];

}

class RegisterState extends BlocState {

  final UserCredential? userCredential;

  RegisterState(this.userCredential);

  @override
  List<Object?> get props => [userCredential];

}