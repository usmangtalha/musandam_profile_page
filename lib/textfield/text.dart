import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController controller;
  final VoidCallback? toggleVisibility;
  final bool isPasswordField;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.controller,
    this.toggleVisibility,
    this.isPasswordField = false,
    this.validator,
}) : super(key: key);

  OutlineInputBorder customBorder (Color color, double width) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
      borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
  topRight: Radius.circular(15),
  bottomLeft: Radius.circular(15),
  ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.lightBlue,
          ),
          suffixIcon: isPasswordField ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.lightBlue,
            ),
            onPressed: toggleVisibility,
          )
          : null,
          hintText: hintText!,
          hintStyle: TextStyle(
            color: Colors.lightGreen,
            fontSize: 16,
          ),
          border: customBorder(Colors.lightBlue, 1.5),
          enabledBorder: customBorder(Colors.lightBlue, 1.5),
          focusedBorder: customBorder(Colors.blue, 1.5),
          errorBorder: customBorder(Colors.red, 1.5),
          focusedErrorBorder: customBorder(Colors.red, 1.5),
        ),
      ),
    );
  }
}
