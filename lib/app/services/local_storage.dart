import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }


}
