class FilterParams {
  final bool? isPaid;
  final DateTime? minDate;
  final DateTime? maxDate;
  final double? minValue;
  final double? maxValue;
  final int? month;

  FilterParams({
    this.isPaid,
    this.minDate,
    this.maxDate,
    this.minValue,
    this.maxValue,
    this.month,
  });

  FilterParams copyWith({
    bool? isPaid,
    DateTime? minDate,
    DateTime? maxDate,
    double? minValue,
    double? maxValue,
    int? month,
  }) {
    return FilterParams(
      isPaid: isPaid ?? this.isPaid,
      minDate: minDate ?? this.minDate,
      maxDate: maxDate ?? this.maxDate,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      month: month ?? this.month,
    );
  }

  bool isFiltering() {
    if (this.maxDate == null &&
        this.maxValue == null &&
        this.minDate == null &&
        this.maxDate == null)
      return false;
    else
      return true;
  }
}
