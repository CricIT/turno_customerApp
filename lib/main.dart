import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/services/firebase.dart';
import 'package:turno_customer_application/data/repositories/login_repository.dart';
import 'package:turno_customer_application/data/repositories/otp_repository.dart';
import 'app/config/constant.dart';
import 'app/routes/app_route.dart';
import 'app/routes/page_route.dart';
import 'app/services/local_storage.dart';
import 'app/util/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  await initServices();
  //fetch all languages .json files and convert
  Map<String, Map<String, String>> languages =
      await Messages.getAllTranslations();
  runApp(MyApp(languages));
}

initServices() async {
  await Get.putAsync(() => LocalStorageService().init());
  Get.put(FirebaseService(), permanent: true);
  Get.put(LoginRepositoryIml());
  Get.put(OtpRepositoryIml());
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp(this.languages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.APP_NAME,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      translations: Messages(languages: languages),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.LANGUAGE,
      getPages: Routes.getAllPages(),
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
