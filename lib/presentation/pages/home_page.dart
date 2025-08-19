// lib/presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/presentation/pages/menu_page.dart';
import '../controllers/home_controller.dart';
import '../widgets/property_card.dart';
import '../../../core/constants/app_colors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MenuPage(),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: 'Jakarta',
                  style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, // <-- makes text bold
                  color: Colors.black,
                ),
                  //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  items: [
                    DropdownMenuItem<String>(
                      value: 'Jakarta',
                      child: Text('Jakarta'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Dubai',
                      child: Text('Dubai'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Dhaka',
                      child: Text('Dhaka'),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    // Handle the selection
                    if (newValue != null) {
                      print("Selected: $newValue");
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: AppColors.primary),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              //focusNode: controller.searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Search address, or near you',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon:
                Icon(Icons.search, color: AppColors.primary),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'House',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, // Smaller text size
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Adjust padding to fit
                    ),
                    child:  Text(
                      'Apartment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis, // Ensures text stays in one line
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Hotel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, // Smaller text size
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Villa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, // Smaller text size
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Near from you'),
                TextButton(
                  onPressed: () {},
                  child: Text('See more'),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: controller.properties.isNotEmpty
                  ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.properties.length,
                itemBuilder: (_, i) {
                  final property = controller.properties[i];
                  return InkWell(
                    onTap: () {
                      // Navigate to detail page with the selected property
                      Get.toNamed('/detail', arguments: property);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image with overlay
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                // Load image from property object
                                Image.network(
                                  property.imageUrl ?? '',
                                  fit: BoxFit.cover,
                                  width: 225,
                                  height: 300,
                                  errorBuilder: (context, error, stackTrace) {
                                    print('Image load error: $error');
                                    return Container(
                                      width: 150,
                                      height: 120,
                                      color: Colors.grey,
                                      child: Icon(Icons.error, color: Colors.white),
                                    );
                                  },
                                ),
                                // Text overlay at bottom
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    color: Colors.black.withOpacity(0.5),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          property.name ?? "No Name",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          property.owner ?? "No Address",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  : const Center(child: Text('No images available')),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Best from you'),
                TextButton(
                  onPressed: () {},
                  child: Text('See more'),
                ),
              ],
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // One column per line
                childAspectRatio: 3, // Adjusted to fit the wider layout
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.properties.length,
              itemBuilder: (_, i) {
                final reverseIndex = controller.properties.length - 1 - i; // Reverse the index
                return InkWell(
                  onTap: () {
                    // Navigate to detail page with the selected property
                    Get.toNamed('/detail', arguments: controller.properties[reverseIndex]);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image on the left
                      Container(
                        width: 120, // Medium-sized image width
                        height: 100, // Fixed height
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(controller.properties[reverseIndex].imageUrl ?? 'https://via.placeholder.com/120x100'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Details on the right
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.properties[reverseIndex].name ?? 'Unknown Property',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.properties[reverseIndex].price ?? 'Rp. 0 / Year',
                                style: TextStyle(fontSize: 16, color: Colors.blue),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.bed, size: 16),
                                  SizedBox(width: 4),
                                  Text('${controller.properties[reverseIndex].bedrooms ?? 0} Bedroom'),
                                  SizedBox(width: 8),
                                  Icon(Icons.bathtub, size: 16),
                                  SizedBox(width: 4),
                                  Text('${controller.properties[reverseIndex].bathrooms ?? 0} Bathroom'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('For You'),
                TextButton(
                  onPressed: () {},
                  child: Text('See more'),
                ),
              ],
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.properties.length,
              itemBuilder: (_, i) => PropertyCard(
                property: controller.properties[i],
              ),
            ),
          ],
        ),
      )),
    );
  }
}