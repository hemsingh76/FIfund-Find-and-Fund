import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../custom_widgets/custom_textField.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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

              customTextField('Email', Icons.email),

              SizedBox(height: 15),

              customTextField('Password', Icons.lock),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text("Login"),
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
