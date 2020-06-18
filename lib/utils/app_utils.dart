import 'package:intl/intl.dart';

class AppUtil {
  static String formatDateInArabic(String date) {
    DateTime datetime = DateTime.parse(date);
    var formatter = DateFormat('E، d MMMM، KK:mm a', 'ar_SA');
    String formatted = formatter.format(datetime);
    return formatted;
  }
}
