import 'package:hive/hive.dart';

part 'emergency.g.dart';

@HiveType(typeId: 0)
class Emergency extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String iconUrl;
  @HiveField(2)
  final List<dynamic> description;

  Emergency(
      {required this.name, required this.iconUrl, required this.description});
}
