import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:material_costing_app/models/material_model.dart';
import 'package:uuid/uuid.dart';
import '../../models/material_item.dart';
import '../../models/process_log.dart';

class LogUsageScreen extends StatefulWidget {
  const LogUsageScreen({super.key});

  @override
  State<LogUsageScreen> createState() => _LogUsageScreenState();
}

class _LogUsageScreenState extends State<LogUsageScreen> {
  final Box<MaterialItem> _materialsBox = Hive.box<MaterialItem>('materialsBox');
  final Box<ProcessLog> _logsBox = Hive.box<ProcessLog>('logsBox');

  MaterialItem? selectedMaterial;
  final _quantityController = TextEditingController();
  final _processingCostController = TextEditingController();

  void _logUsage() {
    if (selectedMaterial == null) return;

    final quantity = double.tryParse(_quantityController.text) ?? 0;
    final processingCost = double.tryParse(_processingCostController.text) ?? 0;
    final id = const Uuid().v4();

    final log = ProcessLog(
      id: id,
      materialId: selectedMaterial!.id,
      quantityUsed: quantity,
      processingCost: processingCost,
      timestamp: DateTime.now(),
    );

    // Save log
    _logsBox.put(id, log);

    // Update material stock
    selectedMaterial!.stockLevel -= quantity;
    selectedMaterial!.save();

    _quantityController.clear();
    _processingCostController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final materials = _materialsBox.values.toList();
    return Scaffold(
      appBar: AppBar(title: const Text("Log Material Usage")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButton<MaterialItem>(
              isExpanded: true,
              value: selectedMaterial,
              hint: const Text("Select Material"),
              items: materials.map((mat) {
                return DropdownMenuItem(value: mat, child: Text(mat.name));
              }).toList(),
              onChanged: (val) => setState(() => selectedMaterial = val),
            ),
            TextField(controller: _quantityController, decoration: const InputDecoration(labelText: 'Quantity Used'), keyboardType: TextInputType.number),
            TextField(controller: _processingCostController, decoration: const InputDecoration(labelText: 'Processing Cost'), keyboardType: TextInputType.number),
            ElevatedButton(onPressed: _logUsage, child: const Text("Log Usage")),
          ],
        ),
      ),
    );
  }
}
