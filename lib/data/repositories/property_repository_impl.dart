import '../../domain/entities/property.dart';
import '../../domain/repositories/property_repository.dart';
import '../datasources/property_data_source.dart';
import '../models/property_model.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  final PropertyDataSource dataSource;

  PropertyRepositoryImpl(this.dataSource);

  @override
  Future<List<Property>> getProperties() async {
    try {
      final List<PropertyModel> models = await dataSource.loadProperties();
      return models.map((model) => Property(
        id: model.id,
        name: model.name,
        imageUrl: model.imageUrl,
        price: model.price,
        bedrooms: model.bedrooms,
        bathrooms: model.bathrooms,
        description: model.description,
        owner: model.owner,
        gallery: model.gallery,
        mapImage: model.mapImage,
      )).toList();
    } catch (e) {
      throw Exception('Error in repository: $e');
    }
  }
}