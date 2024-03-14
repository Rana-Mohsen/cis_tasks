import 'package:flutter/material.dart';

class CustomChoiceChip extends StatefulWidget {
  const CustomChoiceChip({
    super.key,required this.index
  });
  final int index;
  @override
  State<CustomChoiceChip> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomChoiceChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      showCheckmark: false,
      elevation: 1,
      shadowColor: Colors.grey.withOpacity(0.5),
      padding: EdgeInsets.all(8),
      label: Text(
        'button3',
        style: TextStyle(fontSize: 17),
      ),
      labelPadding: EdgeInsets.symmetric(horizontal: 16),
      // color of selected chip
      selectedColor: Colors.red,
      // selected chip value
      selected: isSelected,
      // onselected method
      onSelected: (bool selected) {
        setState(() {
          isSelected = selected;
        });
      },
    );
  }
}
