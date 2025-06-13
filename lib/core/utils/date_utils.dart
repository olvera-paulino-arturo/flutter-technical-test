import 'package:intl/intl.dart';

class DateUtils {
  static String dateToString(DateTime date){
    return DateFormat().format(date);
  }
}