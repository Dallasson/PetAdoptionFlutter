import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'app_router.dart';

void main()  async {

  await GetStorage.init();
  runApp(GetMaterialApp(
    initialRoute: AppRouter.splashScreen,
    getPages: AppRouter.pages,
    debugShowCheckedModeBanner: false,
  ));
}


