class Property {
  final String id;
  final String name;
  final String imageUrl;
  final String price;
  final String description;
  final String owner;
  final int bedrooms;
  final int bathrooms;
  final List<String>? gallery;
  final String? mapImage;

  Property({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.owner,
    required this.bedrooms,
    required this.bathrooms,
    required this.gallery,
    required this.mapImage,
  });
}