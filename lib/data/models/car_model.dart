import 'package:car_app/domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  CarModel(
     {
    required super.id,
    required super.vin,
    required super.displayColor,
    required super.year,
    required super.make,
    required super.model,
    required super.price,
    required super.mileage,
    required super.city,
    required super.lat,
    required super.lon,
    required super.primaryPhotoUrl,
    required super.condition,
    required super.dealerName,
    required super.state,
    required super.trim,
    required super.clickoffUrl,
    required super.bodyType,
    required super.bodyStyle,
    required super.thumbnailUrl,
     required super.photoUrls,
  });



  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? 0,
      vin: json['vin'] ?? '',
      displayColor: json['displayColor'] ?? '',
      year: json['year'] ?? 0,
      make: json['make'] ?? '',
      model: json['model'] ?? '',
      price: json['price'] ?? '',
      mileage: json['mileage'] ?? '',
      city: json['city'] ?? '',
      lat: json['lat']?.toDouble() ?? 0.0,
      lon: json['lon']?.toDouble() ?? 0.0,
      primaryPhotoUrl: json['primaryPhotoUrl'] ?? '',
      condition: json['condition'] ?? '',
      dealerName: json['dealerName'] ?? '',
      state: json['state'] ?? '',
      trim: json['trim'] ?? '',
      clickoffUrl: json['clickoffUrl'] ?? '',
      bodyType: json['bodyType'] ?? '',
      bodyStyle: json['bodyStyle'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      photoUrls: List<String>.from(json['photoUrls'] ?? []),
    );
  }

  // Method to convert CarModel to CarEntity
  CarEntity toEntity() {
    return CarEntity(
      id: id,
      vin: vin,
      displayColor: displayColor,
      year: year,
      make: make,
      model: model,
      price: price,
      mileage: mileage,
      city: city,
      lat: lat,
      lon: lon,
      primaryPhotoUrl: primaryPhotoUrl,
      condition: condition,
      dealerName: dealerName,
      state: state,
      trim: trim,
      clickoffUrl: clickoffUrl,
      bodyType: bodyType,
      bodyStyle: bodyStyle,
      thumbnailUrl: thumbnailUrl,
       photoUrls: photoUrls,
    );
  }
}
