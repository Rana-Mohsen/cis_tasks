import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeTextField extends StatelessWidget {
  CustomeTextField({super.key, this.hintText, required this.onChange});

  String? hintText;
  Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search,color: Colors.black,),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
          color:  Colors.black,
        )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
        )),
      ),
    );
  }
}
