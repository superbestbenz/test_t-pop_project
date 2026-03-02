import 'package:intl/intl.dart';

String formatDate(DateTime? isoString) {
  if (isoString == null) return '';
  final formatter = DateFormat('dd/MM/yyyy HH:mm');
  return formatter.format(isoString);
}