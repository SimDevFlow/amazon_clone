import 'package:flutter/material.dart';

class CustumTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustumTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'enter your $hintText';
        }
        return null;
      },
    );
  }
}
