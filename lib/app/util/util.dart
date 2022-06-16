import 'package:intl/intl.dart';

class Utils {
  static String getImagePath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String convertDate(int? timeStamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp!);
    var format = DateFormat.yMMMMd();
    var dateString = format.format(date);
    return dateString;
  }
}
