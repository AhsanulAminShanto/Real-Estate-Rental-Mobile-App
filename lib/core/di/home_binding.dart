import 'package:get/get.dart';

import '../../data/datasources/property_data_source.dart';
import '../../data/repositories/property_repository_impl.dart';
import '../../domain/repositories/property_repository.dart';
import '../../domain/usecases/get_properties.dart';
import '../../presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyDataSource());
    Get.lazyPut<PropertyRepository>(() => PropertyRepositoryImpl(Get.find()));
    Get.lazyPut<GetProperties>(() => GetProperties(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}