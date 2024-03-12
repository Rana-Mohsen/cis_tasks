import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        prefixIcon: Icon(Icons.search,color: Colors.black,),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
          color: Colors.black,
        )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
          color: Colors.black,
          width: 2.0,
        )),
      ),
    );
  }
}
