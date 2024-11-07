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
}
