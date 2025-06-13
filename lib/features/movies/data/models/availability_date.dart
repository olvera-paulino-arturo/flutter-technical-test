class AvailabilityDate {
  String maximum;
  String minimum;

  AvailabilityDate({
    required this.maximum,
    required this.minimum,
  });

  factory AvailabilityDate.fromJson(Map<String, dynamic> json) => AvailabilityDate(
    maximum: json['maximum'],
    minimum: json['minimum'],
  );

}