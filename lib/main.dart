import 'package:flutter/material.dart';
import 'package:material_costing_app/models/auth_provider.dart';
import 'package:material_costing_app/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/material_item.dart';
import 'models/process_log.dart';
import 'providers/auth_provider.dart';
import 'screens/login/login_screen.dart';
import 'screens/admin/material_screen.dart';
import 'screens/operator/log_usage_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(MaterialItemAdapter());
  Hive.registerAdapter(ProcessLogAdapter());

  await Hive.openBox<MaterialItem>('materialsBox');
  await Hive.openBox<ProcessLog>('logsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'SmartFab App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Consumer<AuthProvider>(
          builder: (context, auth, _) {
            if (auth.currentUserRole == 'admin') {
              return const MaterialScreen();
            } else if (auth.currentUserRole == 'operator') {
              return const LogUsageScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
