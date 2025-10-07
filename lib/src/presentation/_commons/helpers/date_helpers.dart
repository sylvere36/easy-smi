// Format Date ex: Lun 04 Mars,2025
import 'package:intl/intl.dart';

String formatDate(String dateStr) {
  try {
    final date = DateTime.parse(dateStr);
    final formatter = DateFormat('EEE dd MMMM,yyyy', 'fr_FR');
    return formatter.format(date);
  } catch (e) {
    return dateStr; // Return the original string if parsing fails
  }
}

// Format DateTime ex: 04/03/2025
String formatSimplified(DateTime? date) {
  if (date == null) return '--';
  final formatter = DateFormat('dd/MM/yyyy', 'fr_FR');
  return formatter.format(date);
}

// Format DateTime ex: 13 Mars 2025 · 10:34
String formatDateTimeWithMark(DateTime? date) {
  if (date == null) return '--';
  final formatter = DateFormat('dd MMMM yyyy · HH:mm', 'fr_FR');
  return formatter.format(date);
}
