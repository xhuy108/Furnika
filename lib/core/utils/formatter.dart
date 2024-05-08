import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

final currencyFormatter =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 2);
