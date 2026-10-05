import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Place {
  final String id;
  final String title;
  Place({required this.title}) : id = uuid.v4();
}
