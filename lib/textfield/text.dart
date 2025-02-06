import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final IconData? icon_visibility;
  final bool obscureText;
  final dynamic controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.icon_visibility,
    required this.obscureText,
    required this.controller,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.lightBlue,
          ),
          suffixIcon: Icon(
            icon_visibility,
            color: Colors.lightBlue,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Colors.lightBlue,
              width: 1.5,
            ),
          ),
          hintText: hintText!,
          hintStyle: TextStyle(
            color: Colors.lightGreen,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
