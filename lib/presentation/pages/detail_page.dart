// lib/presentation/pages/detail_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/property.dart'; // Import Property entity

class DetailPage extends StatelessWidget {
  final Property property;
  const DetailPage({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    // Sample gallery images (replace with actual URLs from property data if available)
    final List<String> galleryImages = List.generate(
      10,
          (index) => 'https://via.placeholder.com/100?text=Gallery+${index + 1}',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Property Details'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image with Name, Owner, Bedroom, and Bathroom Overlay at Bottom
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: property.imageUrl.isNotEmpty ? property.imageUrl : 'https://via.placeholder.com/200',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Icon(Icons.error, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            property.name ?? "No Name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            property.owner ?? "No Owner",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Icon(Icons.bed, size: 16, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                '${property.bedrooms ?? 0} Bedroom',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.bathtub, size: 16, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                '${property.bathrooms ?? 0} Bathroom',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Description
            Text('Description',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              property.description ?? 'No description available',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 16),
            // Owner Section with Call and Message Icons
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.owner ?? 'Unknown Owner',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('Owner'),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.call, color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Get.snackbar('Call Action', 'Call functionality to be implemented');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message, color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Get.snackbar('Message Action', 'Message functionality to be implemented');
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            // Gallery of 9-10 Images
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (property.gallery ?? []).length,
                itemBuilder: (_, i) {
                  // Replace invalid Google search URL with a placeholder
                  final imageUrl = (property.gallery![i].contains('google.com/imgres')
                      ? 'https://picsum.photos/200/150?random=${i + 1}'
                      : property.gallery![i]);
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: Icon(Icons.error, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Google Maps Image Placeholder
            CachedNetworkImage(
              imageUrl: property.mapImage ?? 'https://i0.wp.com/www.cssscript.com/wp-content/uploads/2018/03/Simple-Location-Picker.png?fit=561%2C421&ssl=1',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey,
                child: Icon(Icons.error, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            // Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${property.price}''/ year',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar('Rent Action', 'Rent functionality to be implemented');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: Text(
                    'Rent Now',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}