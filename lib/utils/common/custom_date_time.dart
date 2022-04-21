class CustomDateTime {
  late int hour;
  late int minute;

  static CustomDateTime getCustomDateTime() {
    CustomDateTime gmt = CustomDateTime();
    double? time = double.tryParse(DateTime.now().timeZoneName);
    gmt.hour = time!.toInt();
    gmt.minute = ((time - gmt.hour.toDouble()) * 60).toInt();
    return gmt;
  }
}
