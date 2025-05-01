import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toFormattedDate() => DateFormat('dd/MM/yyyy').format(this);
}
