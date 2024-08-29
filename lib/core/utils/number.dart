import 'package:intl/intl.dart';

extension DoubleX on double {
  String moneyFormat() => NumberFormat("#,##0", "en_US").format(this);
}
