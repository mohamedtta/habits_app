import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  TextEditingController controller;
  String text;
  Widget? suffixIcon;
  MyForm({super.key, required this.controller, required this.text,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          label: Text(text),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
