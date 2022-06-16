import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/services/firebase.dart';
import 'package:turno_customer_application/presentation/controllers/lang/lang_controller.dart';
import 'package:turno_customer_application/presentation/controllers/permissions/permission_controller.dart';
import 'app/config/app_colors.dart';
import 'package:turno_customer_application/app/util/dependency.dart';

import 'app/config/constant.dart';
import 'app/routes/app_route.dart';
import 'app/routes/page_route.dart';
import 'app/services/local_storage.dart';
import 'app/util/messages.dart';

void main() async {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.mediumGray,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));
  await initServices();
  //fetch all languages .json files and convert
  Map<String, Map<String, String>> languages =
      await Messages.getAllTranslations();
  runApp(MyApp(languages));
}

initServices() async {
  await Firebase.initializeApp();
  await Get.putAsync(() => LocalStorageService().init());
  Get.put(FirebaseService(), permanent: true);
  Get.put(PermissionsController());
  Get.put(LangController(), permanent: true);
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  final store = Get.find<LocalStorageService>();
  MyApp(this.languages, {Key? key}) : super(key: key);
  final permissions = Get.find<PermissionsController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      translations: Messages(languages: languages),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: AppRoutes.PERMISSIONS,
      initialRoute:
          store.isLoggedIn ? AppRoutes.LANDING_PAGE : AppRoutes.LANGUAGE,
      getPages: Routes.getAllPages(),
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
