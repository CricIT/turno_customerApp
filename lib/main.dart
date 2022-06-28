import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:turno_customer_application/app/core/firebase/firebase_handler.dart';
import 'package:turno_customer_application/app/services/firebase.dart';
import 'package:turno_customer_application/presentation/controllers/lang/lang_controller.dart';
import 'package:turno_customer_application/presentation/controllers/permissions/permission_controller.dart';
import 'package:turno_customer_application/app/util/dependency.dart';
import 'app/config/app_colors.dart';
import 'app/config/constant.dart';
import 'app/routes/app_route.dart';
import 'app/routes/page_route.dart';
import 'app/services/local_storage.dart';
import 'app/util/messages.dart';
import 'presentation/controllers/permissions/permission_controller.dart';
import 'dart:ui' as ui;

void main() async {
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.lightPurple,
    statusBarIconBrightness: Brightness.light, // For Android (dark icons)
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
  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          false // option: set to false to disable working with http links (default: false)
      );
  hasAllPermissions = await checkPermissions();
  await Get.putAsync(() => LocalStorageService().init());
  Get.put(FirebaseService(), permanent: true);
  Get.put(PermissionsController());
  Get.put(LangController(), permanent: true);
}

bool hasAllPermissions = false;

Future<bool> checkPermissions() async {
  bool smsPermission = await Permission.sms.isGranted;
  bool locationPermission = await Permission.location.isGranted;
  bool storagePermission = await Permission.storage.isGranted;
  if (smsPermission && locationPermission && storagePermission) return true;
  return false;
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  final store = Get.find<LocalStorageService>();
  MyApp(this.languages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [FirebaseHandler.observer],
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      translations: Messages(languages: languages),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: !hasAllPermissions
          ? AppRoutes.PERMISSIONS
          : store.isLoggedIn
              ? AppRoutes.LANDING_PAGE
              : AppRoutes.LANGUAGE,
      getPages: Routes.getAllPages(),
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
