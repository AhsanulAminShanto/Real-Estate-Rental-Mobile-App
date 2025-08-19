import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/property_model.dart';

class PropertyDataSource {
  Future<List<PropertyModel>> loadProperties() async {
    try {
      final String response = await rootBundle.loadString('assets/data/properties.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => PropertyModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load properties: $e');
    }
  }
}