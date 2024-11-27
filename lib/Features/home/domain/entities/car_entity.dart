class CarEntity {
  final int id;
  final String vin;
  final String displayColor;
  final int year;
  final String make;
  final String model;
  final String price;
  final String mileage;
  final String city;
  final double lat;
  final double lon;
  final String primaryPhotoUrl;
  final String condition;
  final String dealerName;
  final String state;
  final String trim;
  final String clickoffUrl;
  final String bodyType;
  final String bodyStyle;
  final String thumbnailUrl;
  final List<String> photoUrls;  // New field to store multiple photo URLs

  CarEntity({
    required this.id,
    required this.vin,
    required this.displayColor,
    required this.year,
    required this.make,
    required this.model,
    required this.price,
    required this.mileage,
    required this.city,
    required this.lat,
    required this.lon,
    required this.primaryPhotoUrl,
    required this.condition,
    required this.dealerName,
    required this.state,
    required this.trim,
    required this.clickoffUrl,
    required this.bodyType,
    required this.bodyStyle,
    required this.thumbnailUrl,
    required this.photoUrls,  // Include the list of photo URLs
  });
}
