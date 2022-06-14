import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String appName = 'Turno';

  static const List<String> languages = [
    'English',
    'हिन्दी',
    'ಕನ್ನಡ',
    'தமிழ்',
    'తెలుగు'
  ];

  static const List locale = [
    {'name': 'en_US', 'locale': Locale('en', 'US')},
    {'name': 'hi_IN', 'locale': Locale('hi', 'IN')},
    {'name': 'kn_IN', 'locale': Locale('kn', 'IN')},
    {'name': 'ta_IN', 'locale': Locale('ta', 'IN')},
    {'name': 'te_IN', 'locale': Locale('te', 'IN')},
  ];
  static const String otpGifImage = 'assets/images/otp.gif';

  static const String poppins = 'Poppins';

  static const int minHeight = 50;
  static const int maxHeight = 80;

  static double deviceHeight = 0;
  static double deviceWidth = 0;
  static const List<String> loginPageImages = [
    'assets/images/img4.png',
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];
}
