import '../entities/property.dart';
import '../repositories/property_repository.dart';

class GetProperties {
  final PropertyRepository repository;

  GetProperties(this.repository);

  Future<List<Property>> call() async {
    try {
      return await repository.getProperties();
    } catch (e) {
      throw Exception('Use case error: $e');
    }
  }
}