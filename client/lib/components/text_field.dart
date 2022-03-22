import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFF244581)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFF244581)),
          ),
          labelStyle: const TextStyle(color: Color(0xFF244581)),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
