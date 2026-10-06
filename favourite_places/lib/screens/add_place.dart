import 'dart:io';

import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/widgets/image_input.dart';
import 'package:favourite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;
  void onSelectLocation(PlaceLocation location) {
    _selectedLocation = location;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _savePlace() {
    // call the provider to add a new place to the PlacesProvider
    final enteredText = _titleController.text;
    if (enteredText.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredText, _selectedImage!, _selectedLocation!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
            // Image Input
            // onPickImage receives an image from the image input and stores it in the local variable image
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 20),
            LocationInput(
              onSelectLocation: onSelectLocation,
            ),
            const SizedBox(height: 20),
            Container(
              width: 150,
              child: ElevatedButton(
                  onPressed: _savePlace,
                  child: const Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text("Add Place")
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
