import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/custom_edit_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Register",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black87,
                      fontSize: 35),),
                  SizedBox(height: 5,),
                  Text("Please create a new account to start!",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                      fontSize: 20),),
                ],
              ),
              SizedBox(height: 30,),
              CustomEditText(hint: "Full Name", textEditingController: _fullNameController, iconData: Icons.person),
              SizedBox(height: 10,),
              CustomEditText(hint: "Phone Number", textEditingController: _phoneController, iconData: Icons.phone),
              SizedBox(height: 10,),
              CustomEditText(hint: "Email Address", textEditingController: _emailController, iconData: Icons.email),
              SizedBox(height: 10,),
              CustomEditText(hint: "Password", textEditingController: _passwordController, iconData: Icons.password),
              SizedBox(height: 60,),
              CustomButton(text: "Register", onClick: (){

              }),
              SizedBox(height: 30,),
              Text("Have an account ? Login",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                  fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}
