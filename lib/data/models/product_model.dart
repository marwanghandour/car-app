import '../../domain/entities/product.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CategoryModel category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      category: CategoryModel.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      'creationAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'category': category.toJson(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      images: images,
      createdAt: createdAt,
      updatedAt: updatedAt,
      category: category.toEntity(),
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'creationAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
