import 'dart:io';

import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Place {
  final String id;
  final String title;
  final File image;
  Place({required this.title, required this.image}) : id = uuid.v4();
}
