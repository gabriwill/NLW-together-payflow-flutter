String convertDatatimeToString(DateTime date) {
  String day = date.day >= 10 ? date.day.toString() : "0${date.day}";
  String month = date.month >= 10 ? date.month.toString() : "0${date.month}";
  return "$day/$month/${date.year}";
}
