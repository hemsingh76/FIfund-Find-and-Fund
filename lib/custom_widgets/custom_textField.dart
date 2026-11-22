import 'package:flutter/material.dart';

//custom textfield widget
Widget customTextField(
  TextEditingController controller,
  String label,
  IconData icon, {
  bool obscure = false,
  TextInputType? keyboardType,
}) {
  return TextField(
    controller: controller,
    obscureText: obscure,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: label,
      hintText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(),
    ),
  );
}
