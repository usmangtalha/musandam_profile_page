import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String? text;
  final void Function() setstate;

  const CustomButton({
    Key? key,
    required this.text,
    required this.setstate,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: SizedBox(
        width: 350,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
          ),
          onPressed: setstate,
          child: Text(
            text!,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
