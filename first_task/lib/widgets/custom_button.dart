import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          color),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17, color: Colors.black),
                  )),
            );
  }
}