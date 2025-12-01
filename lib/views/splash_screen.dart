import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/app_router.dart';
import 'package:pet/storage_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
       _navigate();
    });

  }

  _navigate() async {

     await Future.delayed(const Duration(seconds: 7));
     if(StorageHelper.isSet()){
       Get.offAndToNamed(AppRouter.loginScreen);
     } else {
       Get.offAndToNamed(AppRouter.introScreen);
     }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/logo.png",
          width: 250,
          height: 250,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,),
        ),
      ),
    );
  }
}
