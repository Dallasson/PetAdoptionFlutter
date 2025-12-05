import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/bloc/pet_bloc.dart';
import 'package:pet/services/firebase_service.dart';

import 'app_router.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "app",
    options: FirebaseOptions(
        apiKey: "AIzaSyCjQ4LkHKM1jaV0BBTAEgThPpSr2GQQzT4",
        appId: "1:22492548263:android:5dc1eab777155e003c9f82",
        messagingSenderId: "22492548263",
        projectId: "attendencesystem-3dc27",
        databaseURL: "https://attendencesystem-3dc27-default-rtdb.firebaseio.com/",
        storageBucket: "gs://attendencesystem-3dc27.appspot.com")
  );
  await GetStorage.init();

  runApp(
    BlocProvider(
      create: (context) => PetBloc(FirebaseService()),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.splashScreen,
        getPages: AppRouter.pages,
      ),
    ),
  );
}
