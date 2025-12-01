


import 'package:get_storage/get_storage.dart';

class StorageHelper {


   static var storageBox = GetStorage();

   static void setStatus() => storageBox.write("isDone", true);
   static bool isSet() => storageBox.read("isDone") ?? false;

}