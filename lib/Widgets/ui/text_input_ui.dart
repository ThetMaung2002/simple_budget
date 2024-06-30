import 'package:flutter/material.dart';

class TextInputUI extends StatelessWidget {
  const TextInputUI(
      {super.key, required this.hintText, this.controller, this.keyboardType});

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
