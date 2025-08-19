Real Estate App
Project Overview
This is a Flutter-based real estate mobile application designed to browse and view property listings. Built using Clean Architecture principles, it ensures scalability and maintainability. The app utilizes GetX for state management and dependency injection, Go Router for navigation, and hardcoded JSON data for property listings. The project structure separates concerns into core, data, domain, and presentation layers, with all source code organized under the lib directory.
Features

Home Page: Displays a location dropdown, search bar, category buttons (House, Apartment, Hotel, Villa), a "Near from you" grid view, and a "Best for you" horizontal list view of properties.
Property Cards: Shows property image, name, price, and bedroom/bathroom details. Tapping a card navigates to the detail page.
Detail Page: Displays property image, name, description, owner, price, and a "Rent Now" button (placeholder functionality).
Drawer Menu: Provides navigation links for profile, bookmark, nearby, and other features.
Responsive Design: Optimized for mobile screens with a clean UI.

File Structure
All source code is organized under the lib directory:

lib/

├── core/

│ ├── constants/

│ │ └── app\_colors.dart # Defines app color constants

│ ├── di/

│ │ └── home\_binding.dart # Dependency injection configuration

│ ├── router/

│ │ └── app\_router.dart # Go Router configuration

│ ├── theme/

│ │ └── app\_theme.dart # App theme settings

│ └── utils/

│ └── helpers.dart # Optional utility functions

├── data/

│ ├── datasources/

│ │ └── property\_data\_source.dart # Loads hardcoded JSON data

│ ├── models/

│ │ └── property\_model.dart # JSON serializable property model

│ └── repositories/

│ ├── property\_repository.dart # Repository interface

│ └── property\_repository\_impl.dart # Repository implementation

├── domain/

│ ├── entities/

│ │ └── property.dart # Business entity for properties

│ ├── repositories/

│ │ └── property\_repository.dart # Repository abstraction

│ └── usecases/

│ └── get\_properties.dart # Business logic use case

├── presentation/

│ ├── controllers/

│ │ └── home\_controller.dart # Manages home page state

│ ├── pages/

│ │ ├── home\_page.dart # Home screen UI

│ │ └── detail\_page.dart # Property detail screen UI

│ └── widgets/

│ ├── property\_card.dart # Reusable property card widget

│ └── custom\_app\_bar.dart # Optional reusable AppBar widget

└── main.dart # App entry point

Assets are stored outside lib:

textassets/

└── data/

└── properties.json # Hardcoded property data

Dependencies
The app relies on the following packages (versions based on August 19, 2025; check pubspec.yaml for exact versions):

flutter: SDK (core Flutter functionality).
go_router: ^14.2.1 (for navigation).
get: ^4.6.6 (for state management and dependency injection).
cached_network_image: ^3.3.1 (for efficient image loading).
json_annotation: ^4.8.0 (for JSON serialization).
build_runner: ^2.4.0 (dev dependency for code generation).

To install dependencies:
textflutter pub get
Steps to Run the App

Install Flutter: Ensure Flutter is installed (version 3.8.1 or later). Verify with flutter doctor.
Clone the Repository: Clone the project:
textgit clone https://github.com/AhsanulAminShanto/Real-Estate-Rental-Mobile-App.git
cd real_estate_app

Get Dependencies: Run:
textflutter pub get

Generate JSON Serialization Code: For property_model.dart, run:
textflutter pub run build_runner build

Run the App: Launch on an emulator or device:
textflutter run

The app starts at /home with the HomePage. Tap a property card to navigate to /detail.


Build for Production: For a release build:
textflutter build apk --release  # For Android
flutter build ios --release  # For iOS


Code Optimizations and Logic

Optimizations:

Obx in HomePage enables reactive UI updates, minimizing rebuilds.
CachedNetworkImage caches images, reducing network calls.
Get.lazyPut in HomeBinding lazily loads dependencies, optimizing memory usage.


Logic:

Data flows from PropertyDataSource (async JSON load with error handling) to PropertyRepositoryImpl, through GetProperties use case, to HomeController.
DetailPage uses the passed Property directly, avoiding extra fetches.
Navigation uses context.push with Go Router’s extra for efficient entity passing.


Example: property_data_source.dart uses rootBundle.loadString with try-catch for robust data loading.

Troubleshooting

Images Not Loading: Ensure network access or verify imageUrl in properties.json. Fallback URLs are used in PropertyCard.
Navigation Errors: Check app_router.dart routes and ensure property.id is valid in HomeController.
JSON Errors: If build_runner fails, run flutter clean and retry.
Git Push Failures: Large build files may exceed GitHub’s 100 MB limit. Run git rm -r --cached build/ and git commit to ignore, or use BFG to clean history (see below).

Future Improvements

Integrate a real API instead of hardcoded JSON.
Add location-based filtering in the dropdown.
Implement "Rent Now" functionality with payment integration.
Add user authentication and bookmark features.


