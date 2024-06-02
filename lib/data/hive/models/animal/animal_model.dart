import 'package:hive/hive.dart';

part 'animal_model.g.dart';

@HiveType(typeId: 1)
class AnimalModel {
  AnimalModel(
      {required this.name,
      required this.description,
      required this.image,
      this.isLock = true,
      required this.isPaid});

  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  String image;

  @HiveField(3)
  bool isLock = true;

  @HiveField(4)
  bool isPaid;
}
