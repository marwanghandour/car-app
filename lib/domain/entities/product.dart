// Assuming this is the structure of ProductEntity
import '../../data/models/product_model.dart';

class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CategoryEntity category;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  // Convert ProductEntity to ProductModel
  ProductModel toModel() {
    return ProductModel(
      id: id,
      title: title,
      price: price,
      description: description,
      images: images,
      createdAt: createdAt,
      updatedAt: updatedAt,
      category: category.toModel(),
    );
  }
}

class CategoryEntity {
  final int id;
  final String name;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert CategoryEntity to CategoryModel
  CategoryModel toModel() {
    return CategoryModel(
      id: id,
      name: name,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
