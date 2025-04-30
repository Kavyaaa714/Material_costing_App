import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ProcessLog extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String materialId;

  @HiveField(2)
  double quantityUsed;

  @HiveField(3)
  double processingCost;

  @HiveField(4)
  DateTime timestamp;

  ProcessLog({
    required this.id,
    required this.materialId,
    required this.quantityUsed,
    required this.processingCost,
    required this.timestamp,
  });
}
