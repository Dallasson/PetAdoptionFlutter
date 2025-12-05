import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/bloc/pet_bloc.dart';
import 'package:pet/services/firebase_service.dart';

import 'app_router.dart';

void main()  async {

  await GetStorage.init();
  runApp(BlocProvider(
    create: (_) => PetBloc(FirebaseService()),
    child: GetMaterialApp(
      initialRoute: AppRouter.splashScreen,
      getPages: AppRouter.pages,
      debugShowCheckedModeBanner: false,
    ),
  ));
}


