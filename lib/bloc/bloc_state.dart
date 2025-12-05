

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocState extends Equatable {

}


class INITIAL extends BlocState {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class ERROR extends BlocState {

  final String? error;
  ERROR(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}

class LOADING extends BlocState {

  final bool isLoading;
  LOADING(this.isLoading);

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading];
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

class UploadUserState extends BlocState {

  final bool isUploaded;
  UploadUserState(this.isUploaded);

  @override
  List<Object?> get props => [isUploaded];

}