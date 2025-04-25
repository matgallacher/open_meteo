class Location {
  final double latitude;
  final double longitude;
  final String name;
  final String? description;

  Location({
    required this.latitude,
    required this.longitude,
    required this.name,
    this.description,
  });

  @override
  int get hashCode => Object.hash(latitude, longitude);

  @override
  bool operator ==(Object other) =>
      other is Location && hashCode == other.hashCode;
}
