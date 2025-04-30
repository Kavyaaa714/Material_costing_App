double calculateFinalPrice({
  required double unitCost,
  required double quantityUsed,
  required double processingCost,
  required double marginPercent,
}) {
  final rawMaterialCost = unitCost * quantityUsed;
  final manufacturingCost = rawMaterialCost + processingCost;
  final finalPrice = manufacturingCost * (1 + marginPercent / 100);
  return finalPrice;
}
