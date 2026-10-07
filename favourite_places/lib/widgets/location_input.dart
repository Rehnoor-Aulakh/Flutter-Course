import 'dart:convert';

import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationInput extends StatefulWidget {
  final void Function(PlaceLocation location) onSelectLocation;
  const LocationInput({super.key, required this.onSelectLocation});

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  String googleMapsKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? 'Key not found';
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  String get locationImage {
    if (_pickedLocation == null) return '';
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$googleMapsKey';
  }

  Future<void> _savePlace(double lat, double lng) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleMapsKey');

    final response = await http.get(url);
    final responseData = json.decode(response.body);

    String address = 'Lat: $lat, Lng: $lng';
    if (responseData['results'] != null && responseData['results'].isNotEmpty) {
      address = responseData['results'][0]['formatted_address'];
    } else {
      print('Geocoding API error or no results: $responseData');
    }

    setState(() {
      _pickedLocation =
          PlaceLocation(latitude: lat, longitude: lng, address: address);
      widget.onSelectLocation(_pickedLocation!);
    });
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    try {
      locationData = await location.getLocation();

      final lat = locationData.latitude;
      final lng = locationData.longitude;

      if (lat == null || lng == null) {
        return;
      }

      _savePlace(lat, lng);
    } catch (error) {
      print('Error getting location: $error');
    } finally {
      setState(() {
        _isGettingLocation = false;
      });
    }
  }

  void _selectOnMap() async {
    final pickedLocation = await Navigator.of(context)
        .push<LatLng>(MaterialPageRoute(builder: (ctx) => const MapScreen()));

    if (pickedLocation == null) return;
    _savePlace(pickedLocation.latitude, pickedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Center(
      child: Text(
        "No location chosen.",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
    );

    if (_isGettingLocation) {
      previewContent = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_pickedLocation != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Map preview not available.\n(Google Maps API billing not enabled)',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          height: 170,
          width: double.infinity,
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              label: const Text('Get Current Location'),
              icon: const Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              label: const Text('Select on Map'),
              icon: const Icon(Icons.map),
            )
          ],
        )
      ],
    );
  }
}
