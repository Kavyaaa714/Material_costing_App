import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class LogModel extends HiveObject {
  @HiveField(0)
  String materialName;

  @HiveField(1)
  int quantityUsed;

  @HiveField(2)
  double totalCost;

  @HiveField(3)
  DateTime date;

  LogModel({
    required this.materialName,
    required this.quantityUsed,
    required this.totalCost,
    required this.date
  });
}
