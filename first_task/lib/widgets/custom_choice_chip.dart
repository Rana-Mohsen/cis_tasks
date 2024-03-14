import 'package:flutter/material.dart';

class CustomChoiceChip extends StatefulWidget {
  const CustomChoiceChip({
    super.key,
  });

  @override
  State<CustomChoiceChip> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomChoiceChip> {

  List<bool> isSel = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List.generate(3, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChoiceChip(
          side: BorderSide.none,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          showCheckmark: false,
          elevation: 1,
          shadowColor: Colors.grey.withOpacity(0.5),
          padding: const EdgeInsets.all(8),
          label: Text(
            'button$index',
            style: const TextStyle(fontSize: 17),
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 16),
          // color of selected chip
          selectedColor: Colors.red,
          // selected chip value
          selected: isSel[index],
          // onselected method
          onSelected: (bool selected) {
            setState(() {
              isSel.fillRange(0, 3, false);
              isSel[index] = selected;
            });
          },
        ),
      );
    }));
  }
}
