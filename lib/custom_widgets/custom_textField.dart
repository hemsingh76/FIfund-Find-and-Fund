import 'package:flutter/material.dart';

//custom textfield widget
Widget customTextField(String label, IconData icon) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      hintText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(),
    ),
  );
}