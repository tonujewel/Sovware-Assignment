import 'package:hive/hive.dart';
part 'home_hive_dm.g.dart';

@HiveType(typeId: 1)
class HomeHiveDm extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String avatar;
  @HiveField(4)
  final String htmlUrl;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String gitUrl;
  @HiveField(8)
  final String createdAt;
  @HiveField(9)
  final String updatedAt;
  @HiveField(10)
  final String size;
  @HiveField(11)
  final String stargazersCount;
  @HiveField(12)
  final String ownerName;

  HomeHiveDm({
    required this.name,
    required this.fullName,
    required this.avatar,
    required this.htmlUrl,
    required this.description,
    required this.gitUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.size,
    required this.stargazersCount,
    required this.ownerName,
    required this.id,
  });
}
