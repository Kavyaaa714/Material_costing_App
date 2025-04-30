import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class MaterialItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String unit;

  @HiveField(3)
  double unitCost;

  @HiveField(4)
  double stockLevel;

  MaterialItem({
    required this.id,
    required this.name,
    required this.unit,
    required this.unitCost,
    required this.stockLevel,
  });
}

