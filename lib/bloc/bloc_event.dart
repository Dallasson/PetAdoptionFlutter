


import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocEvent {

}

class LoginEvent extends BlocEvent {

  String? email;
  String? password;

  LoginEvent(this.email,this.password);

}

class RegisterEvent extends BlocEvent {

  String? email;
  String? password;

  RegisterEvent(this.email,this.password);
}

class UploadUserEvent extends BlocEvent {

  String? fullName;
  String? phoneNumber;
  String? email;

  UploadUserEvent(this.fullName,this.phoneNumber,this.email);

}

