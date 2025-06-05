class Hospital {
  final String name;
  final String address;
  final String mapUrl;
  final String governorate;

  Hospital({
    required this.name,
    required this.address,
    required this.mapUrl,
    required this.governorate,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      mapUrl: json['map_url'] ?? '',
      governorate: json['governorate'] ?? '',
    );
  }
}
