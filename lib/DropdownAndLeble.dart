import 'package:flutter/material.dart';

import 'dropdwon_button.dart';

class DropdownAndLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  final List<String>? items;
  final String placeholder;
  final Function(String) onChanged; // Callback function to handle item changes
  final bool disabled;

  DropdownAndLabel({
    this.label = 'Default Label',
    this.isRequired = false,
    this.items,
    required this.onChanged, // Define onChanged property
    this.placeholder = "সিলেক্ট করুন",
    this.disabled = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> uniqueItems = items?.toSet().toList() ?? [];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  label,
                  textAlign: TextAlign.left,
                ),
                Text(
                  isRequired ? '*' : '',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: DropDownButton(
            items: uniqueItems,
            placeholder: placeholder,
            onChanged: onChanged,
            disabled: disabled,// Pass the callback function
          ),
        ),
      ],
    );
  }
}
