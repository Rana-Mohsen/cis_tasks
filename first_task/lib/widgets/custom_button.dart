import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
          onPressed: () async {},
          child: Text(
            "button",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Color(0xfff7f2f9)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))))),
    );
  }
}
