import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool multiline;
  const InputField({super.key, required this.hintText, this.multiline = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: multiline ? 3: 1,
      
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: hintText,
        fillColor: Colors.white,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0x4D201A3F),
          fontSize: 14
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25)
        )
      ),
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Color(0xFF201A3F),
        fontSize: 12
      )
    );
  }
}