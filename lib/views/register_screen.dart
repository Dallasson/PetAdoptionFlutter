import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet/app_router.dart';
import 'package:pet/bloc/bloc_event.dart';
import 'package:pet/bloc/pet_bloc.dart';

import '../bloc/bloc_state.dart';
import '../components/custom_button.dart';
import '../components/custom_edit_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  bool isLoading = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetBloc,BlocState>(
      listener: (context,state){
        if(state is LOADING){

          setState(() {
            isLoading = true;
          });

        }
        else if (state is ERROR){

          setState(() {
            isLoading = false;
          });

        }
        else if (state is RegisterState){

          if(state.userCredential!.user != null){
            BlocProvider.of<PetBloc>(context,listen: false).add(UploadUserEvent("fullName", "phoneNumber", "email"));
          } else {
            Fluttertoast.showToast(msg: "Failed to login in user...");
            setState(() {
              isLoading = false;
            });
          }
      }
        else if (state is UploadUserState){
           var isUploaded = state.isUploaded;
           if(isUploaded){
             setState(() {
               isLoading = false;
             });
             Fluttertoast.showToast(msg: "User has been successfully registered...");
             Get.offAndToNamed(AppRouter.homeScreen);
           } else {
             setState(() {
               isLoading = false;
             });
           }
        }
    },
      child: SafeArea(
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

                  var fullName = _fullNameController.text;
                  var phoneNumber = _phoneController.text;
                  var email = _emailController.text;
                  var password = _passwordController.text;

                  if(!validateFullName(fullName)){
                    Fluttertoast.showToast(msg: "Please provide a full name..");
                    return;
                  }

                  if(!validatePhoneNumber(phoneNumber)){
                    Fluttertoast.showToast(msg: "Please provide a phone number..");
                    return;
                  }

                  if(!validateEmail(email)){
                    Fluttertoast.showToast(msg: "Please provide an email...");
                    return;
                  }

                  if(!validatePassword(password)){
                    Fluttertoast.showToast(msg: "Please provide a password..");
                    return;
                  }

                  if(!validatePasswordLength(password)){
                    Fluttertoast.showToast(msg: "Password should not be less than 6 characaters..");
                    return;
                  }

                  BlocProvider.of<PetBloc>(context,listen: false).add(RegisterEvent(email, password));

                }),
                SizedBox(height: 30,),
                Text("Have an account ? Login",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black87,
                    fontSize: 18),),
                SizedBox(height: 30,),
                Visibility(
                  visible: isLoading,
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateFullName(String fullName){
    return fullName.isNotEmpty;
  }

  bool validatePhoneNumber(String phoneNumber){
    return phoneNumber.isNotEmpty;
  }

  bool validateEmail(String email){
    return email.isNotEmpty;
  }

  bool validatePassword(String password){
    return password.isNotEmpty;
  }

  bool validatePasswordLength(String password){
    return password.length < 6;
  }
}
