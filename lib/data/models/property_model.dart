import 'package:json_annotation/json_annotation.dart';

part 'property_model.g.dart';

@JsonSerializable()
class PropertyModel {
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

  PropertyModel({
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

  factory PropertyModel.fromJson(Map<String, dynamic> json) => _$PropertyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}

// Generate the serialization code by running:
// flutter pub run build_runner build