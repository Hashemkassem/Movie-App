import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.hinttext,
      required this.obscureText,
      required this.controller});
  final String hinttext;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded),
          hintText: hinttext,
          fillColor: Colors.white.withOpacity(0.5),
          filled: true,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(30),
          )),
    );
  }
}
