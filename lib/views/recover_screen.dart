import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_router.dart';
import '../components/custom_button.dart';
import '../components/custom_edit_text.dart';

class RecoverScreen extends StatefulWidget {
  const RecoverScreen({super.key});

  @override
  State<RecoverScreen> createState() => _RecoverScreenState();
}

class _RecoverScreenState extends State<RecoverScreen> {

  final TextEditingController _emailController = TextEditingController();

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
                  Text("Recover",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black87,
                      fontSize: 35),),
                  SizedBox(height: 5,),
                  Text("Please provide your email to recover!",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                      fontSize: 20),),
                ],
              ),
              SizedBox(height: 30,),
              CustomEditText(hint: "Email Address", textEditingController: _emailController, iconData: Icons.email),
              SizedBox(height: 20,),
              CustomButton(text: "Recover", onClick: (){

              }),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRouter.loginScreen);
                },
                child: Text("Have an account ? Login",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                    fontSize: 18),),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRouter.registerScreen);
                },
                child: Text("Don't have an account! Register",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                    fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
