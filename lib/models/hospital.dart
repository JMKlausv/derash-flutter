import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hospital.g.dart';

@HiveType(typeId: 2)
class Hospital extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final Map<String, dynamic> location;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String facebook;
  @HiveField(4)
  final String telegram;
  @HiveField(5)
  final String language;

  Hospital(
      {required this.name,
      required this.location,
      required this.phone,
      required this.facebook,
      required this.telegram,
      required this.language});
}
