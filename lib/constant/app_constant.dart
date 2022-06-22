import 'package:intl/intl.dart';

class AppConstant {
  static String dateTimeFomar(String data) {
    // String da = ;

    return DateFormat.yMd('en_US').add_jm().format(DateTime.parse(data));
  }
}
