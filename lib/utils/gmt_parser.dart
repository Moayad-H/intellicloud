import 'package:intl/intl.dart';

DateTime parseGmtDate(String gmtDate) {
  try {
    return DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'")
        .parseUTC(gmtDate)
        .toLocal();
  } catch (e) {
    throw FormatException("Invalid date format: $gmtDate");
  }
}
