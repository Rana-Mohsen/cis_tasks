import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.title});
  final String title;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
          onPressed: () {
            isPressed = !isPressed;
            setState(() {});
          },
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  isPressed ? Colors.red : Color(0xfff7f2f9)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)))),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 17, color: Colors.black),
          )),
    );
  }
}
