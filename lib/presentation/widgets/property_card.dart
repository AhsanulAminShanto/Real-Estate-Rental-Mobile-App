import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../domain/entities/property.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Using CachedNetworkImage for better image handling

class PropertyCard extends StatelessWidget {
  final Property property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    // Debug: Log the property and image URL
    print('PropertyCard - Property: $property, Image URL: ${property.imageUrl}');

    return InkWell(
      onTap: () {
        Get.toNamed('/detail', arguments: property);
      },
      child: SizedBox(
        height: 200, // Maximum height constraint
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with enhanced error handling using CachedNetworkImage
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: property.imageUrl.isNotEmpty ? property.imageUrl : 'https://via.placeholder.com/150',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) {
                    print('Image load error: $error'); // Log the error
                    return Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Icon(Icons.error, color: Colors.white),
                      alignment: Alignment.center,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.name, // Use 'name' instead of 'title'
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      property.price, // Use 'price' as is
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${property.bedrooms} Beds, ${property.bathrooms} Baths', // Combine into description
                      style: TextStyle(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // No 'distance' field in Property, so omitted
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}