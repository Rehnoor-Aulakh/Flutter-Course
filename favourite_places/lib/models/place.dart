import 'dart:io';

import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String addresss;

  const PlaceLocation(
      {required this.latitude,
      required this.longitude,
      required this.addresss});
}

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
  Place({
    required this.title,
    required this.image,
    required this.location,
  }) : id = uuid.v4();
}
