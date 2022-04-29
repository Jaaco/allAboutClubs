class Club {
  String name;
  String country;
  int value;
  String image;
  int europeanTitles;

  Club({
    required this.name,
    required this.country,
    required this.value,
    required this.image,
    required this.europeanTitles,
  });

  factory Club.fromJson(Map<String, Object?> json) => Club(
        name: json['name'] as String,
        country: json['country'] as String,
        value: json['value'] as int,
        image: json['image'] as String,
        europeanTitles: json['european_titles'] as int,
      );
}
