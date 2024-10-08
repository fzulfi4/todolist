import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
class HelperDateConverter {
  static String formatDate(DateTime? dateTime) =>
      DateFormat('dd MMMM yyyy').format(dateTime!);

  static String formatDatePass(DateTime? dateTime) =>
      DateFormat('ddMMyyyy').format(dateTime!);

  static String formatDateTime(DateTime? dateTime) =>
      DateFormat('dd MMMM yyyy HH:mm WIB').format(dateTime!);

  static String formatDateTimeSeconds(DateTime? dateTime) =>
      DateFormat('dd MMMM yyyy HH:mm:ss').format(dateTime!);
}
