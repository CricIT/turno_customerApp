import 'package:get/get.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    TrackHandler.trackScreen(screenName: '/SupportScreen');
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
