import 'package:intl/intl.dart';

String formatDate(DateTime? releaseDate) {
  return  DateFormat.yMd().format(releaseDate!);
}
