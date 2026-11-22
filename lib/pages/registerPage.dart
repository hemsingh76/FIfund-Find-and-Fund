import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../custom_widgets/custom_textField.dart';
import '../services/auth_service.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _loading = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _onRegister() async {
    final first = firstNameController.text.trim();
    final last = lastNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirm = confirmController.text;

    if (first.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('Please fill in all required fields.');
      return;
    }
    if (password != confirm) {
      _showMessage('Passwords do not match.');
      return;
    }

    setState(() => _loading = true);
    final error = await _authService.register(
      email,
      password,
      name: '$first $last'.trim(),
    );
    if (!mounted) return;
    setState(() => _loading = false);

    if (error != null) {
      _showMessage(error);
    }
    // On success the router sees the new user and moves to /dashboard.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            color: const Color(0xFF6C708F),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "REGISTER",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(height: 20),
                customTextField(firstNameController, 'First Name', Icons.person),
                const SizedBox(height: 15),
                customTextField(lastNameController, 'Last Name', Icons.person_2),
                const SizedBox(height: 15),
                customTextField(emailController, 'Email', Icons.email,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 15),
                customTextField(passwordController, 'Password', Icons.lock,
                    obscure: true),
                const SizedBox(height: 15),
                customTextField(
                    confirmController, 'Confirm Password', Icons.lock,
                    obscure: true),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _loading ? null : _onRegister,
                      child: _loading
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text("Register"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: const Text("Or", style: TextStyle(fontSize: 18)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () => context.go('/loginPage'),
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
