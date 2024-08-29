bool isToday(DateTime dateTime) {
  final difference = calculateDaysDifferenceFromNow(dateTime);
  return difference == 0;
}

int calculateDaysDifferenceFromNow(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays;
}