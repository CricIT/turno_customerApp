

import 'package:get/get.dart';

import '../../presentation/pages/home.dart';
import 'app_route.dart';


class Routes {
  static List<GetPage> getAllPages() {
    return [
      GetPage(
        name: AppRoutes.HOME,
        page: () => MyHomePage(),
      ),



    ];
  }
}