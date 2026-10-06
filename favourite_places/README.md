To access variables from a .env file in Dart, you must use the flutter_dotenv package to load the file into memory at runtime.
1. Install the Package
Run the following command in your terminal to add the dependency:
flutter pub add flutter_dotenv

2. Register the .env File as an Asset
Open your pubspec.yaml file and declare the .env file in the assets section so Flutter knows to bundle it with your compiled application:
flutter:
  assets:
    - .env

3. Initialize dotenv in main.dart
Before you can read any variables, you must load the .env file in your main entry point. Update your lib/main.dart file to initialize the package before calling runApp.
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Add this import

Future<void> main() async {
  // Required if you are executing async code before runApp
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load the environment variables
  await dotenv.load(fileName: ".env");
  
  runApp(const MyApp());
}

4. Retrieve the Variable
You can now access your API key anywhere in your Dart code using the dotenv.env map.
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Fetch the variable by its exact name in the .env file
// Use the ?? operator to provide a fallback in case the key is missing
String googleMapsKey = dotenv.env['YOUR_API_KEY_NAME'] ?? 'Key not found';

print(googleMapsKey);

Ensure that you add .env to your .gitignore file so you do not accidentally push your API key to a public repository.