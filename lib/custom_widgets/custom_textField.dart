import 'package:flutter/material.dart';

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