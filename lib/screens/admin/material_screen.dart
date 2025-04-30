import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../models/material_item.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  final Box<MaterialItem> _materialsBox = Hive.box<MaterialItem>('materialsBox');

  final _nameController = TextEditingController();
  final _unitController = TextEditingController();
  final _unitCostController = TextEditingController();
  final _stockLevelController = TextEditingController();

  void _addMaterial() {
    final id = const Uuid().v4();
    final item = MaterialItem(
      id: id,
      name: _nameController.text,
      unit: _unitController.text,
      unitCost: double.tryParse(_unitCostController.text) ?? 0,
      stockLevel: double.tryParse(_stockLevelController.text) ?? 0,
    );
    _materialsBox.put(id, item);
    _clearForm();
    setState(() {});
  }

  void _clearForm() {
    _nameController.clear();
    _unitController.clear();
    _unitCostController.clear();
    _stockLevelController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final materials = _materialsBox.values.toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Materials')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Material Name')),
            TextField(controller: _unitController, decoration: const InputDecoration(labelText: 'Unit (e.g., kg)')),
            TextField(controller: _unitCostController, decoration: const InputDecoration(labelText: 'Unit Cost'), keyboardType: TextInputType.number),
            TextField(controller: _stockLevelController, decoration: const InputDecoration(labelText: 'Stock Level'), keyboardType: TextInputType.number),
            ElevatedButton(onPressed: _addMaterial, child: const Text("Add Material")),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: materials.length,
                itemBuilder: (context, index) {
                  final item = materials[index];
                  return ListTile(
                    title: Text('${item.name} (${item.stockLevel} ${item.unit})'),
                    subtitle: Text('Unit Cost: ₹${item.unitCost}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _materialsBox.delete(item.id);
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
