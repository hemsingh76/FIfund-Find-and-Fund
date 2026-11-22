import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../custom_widgets/custom_textField.dart';
import '../services/auth_service.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService=AuthService();
  bool _loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          color: Color(0xFF6C708F),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),

              SizedBox(height: 20),

              customTextField(emailController, 'Email', Icons.email,
                  keyboardType: TextInputType.emailAddress),

              SizedBox(height: 15),

              customTextField(passwordController, 'Password', Icons.lock, obscure: true),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _loading
                        ? null
                        : () async {
                            setState(() => _loading = true);
                            final error = await _authService.login(
                              emailController.text,
                              passwordController.text,
                            );
                            if (!mounted) return;
                            setState(() => _loading = false);

                            // On success the router redirects to /dashboard.
                            if (error != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(error)),
                              );
                            }
                          },
                    child: _loading
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Login"),
                  ),

                  Container(
                      margin: EdgeInsets.all(20),
                      child: Text("Or", style: TextStyle(fontSize: 18))
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      context.go('/registerPage');
                    },
                    child: Text("Register!"),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
