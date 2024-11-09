class CategoryRowEntity {
  final String name;
  final String imageUrl;

  CategoryRowEntity({
    required this.name,
    required this.imageUrl,
  });
}
final categories = [
      CategoryRowEntity(name: 'BMW', imageUrl: 'assets/images/bmw.png'),
      CategoryRowEntity(name: 'Ferrari', imageUrl: 'assets/images/ferari.png'),
      CategoryRowEntity(name: 'Mercedes', imageUrl: 'assets/images/mercedes.png'),
      CategoryRowEntity(name: 'Tesla', imageUrl: 'assets/images/Tesla_logo.png'),
    ];