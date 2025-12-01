import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/app_router.dart';
import 'package:pet/components/custom_button.dart';
import 'package:pet/components/custom_edit_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
                  Text("Login",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black87,
                  fontSize: 35),),
                  SizedBox(height: 5,),
                  Text("Please login to connect to your account!",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                      fontSize: 20),),
                ],
              ),
              SizedBox(height: 30,),
              CustomEditText(hint: "Email Address", textEditingController: _emailController, iconData: Icons.email),
              SizedBox(height: 10,),
              CustomEditText(hint: "Password", textEditingController: _passwordController, iconData: Icons.password),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRouter.recoverScreen);
                },
                child: Text("Forgot Your Password!",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                    fontSize: 18),),
              ),
              SizedBox(height: 20,),
              CustomButton(text: "Login", onClick: (){

              }),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRouter.registerScreen);
                },
                child: Text("Don't have an account ? Register",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                    fontSize: 18),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
