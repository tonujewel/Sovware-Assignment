import 'package:intl/intl.dart';

class AppConstant {
  static String dateTimeFomar(String data) {
    return DateFormat.yMd('en_US').add_jm().format(DateTime.parse(data));
  }

// dont change the value ---
  static const lastApiCallTimeKey = "timeKey";

  static  int timeDifference(String previousDate) {
    final birthday = DateTime.parse(previousDate);
    final date2 = DateTime.now();
    int difference = date2.difference(birthday).inMinutes.toInt();

    return difference;
  }
}
