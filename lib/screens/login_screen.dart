import 'package:flutter/material.dart';
import 'package:material_costing_app/models/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: usernameController, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final success = auth.login(usernameController.text, passwordController.text);
                if (!success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
