import 'package:intl/intl.dart';

String getDateFromIndex(int index) {
  DateTime currentDate = DateTime.now();
  DateTime targetDate = index<15 ?
    currentDate.subtract(Duration(days: 15 - index)) : currentDate.add(Duration(days: index-15));
  String abbreviatedDay = DateFormat.d().format(targetDate);
  return abbreviatedDay;
}

String getDay(int index) {
    DateTime currentDate = DateTime.now();
    DateTime targetDate = currentDate.subtract(Duration(days: 15 - index));
    String abbreviatedDay = DateFormat.E().format(targetDate);
    return abbreviatedDay;
}

bool isInfinite(number) {
  return number.isInfinite;
}

double linearTransform(double x, double xMin, double xMax, double yMin, double yMax) {
  return ((x - xMin) / (xMax - xMin)) * (yMax - yMin) + yMin;
}

double convertToRange(double inputValue) {
  double xMin = 0;
  double xMax = 288;
  double yMin = 0;
  double yMax = 20;
  return linearTransform(inputValue, xMin, xMax, yMin, yMax);
}

double convertToRange2(double inputValue) {
  double xMin = 0;
  double xMax = 288;
  double yMin = 0;
  double yMax = 56;
  return linearTransform(inputValue, xMin, xMax, yMin, yMax);
}