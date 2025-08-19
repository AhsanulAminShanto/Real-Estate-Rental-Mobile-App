// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      owner: json['owner'] as String,
      bedrooms: (json['bedrooms'] as num).toInt(),
      bathrooms: (json['bathrooms'] as num).toInt(),
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mapImage: json['mapImage'] as String?,
    );

Map<String, dynamic> _$PropertyModelToJson(PropertyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'description': instance.description,
      'owner': instance.owner,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'gallery': instance.gallery,
      'mapImage': instance.mapImage,
    };
