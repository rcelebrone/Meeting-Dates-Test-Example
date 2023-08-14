class DatetimeMapper {
  static List<DateTime> fromApi(List<String> sharedDates) {
    return sharedDates.map((dateStr) {
      final dateTime = DateTime.parse(dateStr);
      return dateTime;
    }).toList();
  }
}
