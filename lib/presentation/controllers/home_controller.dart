import 'package:get/get.dart';
import '../../domain/entities/property.dart';
import '../../domain/usecases/get_properties.dart';

class HomeController extends GetxController {
  final GetProperties getPropertiesUseCase;
  HomeController(this.getPropertiesUseCase);

  var properties = <Property>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProperties();
  }

  Future<void> fetchProperties() async {
    isLoading.value = true;
    try {
      properties.value = await getPropertiesUseCase();
      print('Properties loaded: $properties');
    } catch (e) {
      print('Error fetching properties: $e');
    } finally {
      isLoading.value = false;
    }
  }
}