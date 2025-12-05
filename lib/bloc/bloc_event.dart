


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

