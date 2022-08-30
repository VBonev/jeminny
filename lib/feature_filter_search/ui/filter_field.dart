import 'package:flutter/material.dart';

import '../../common_ui/form_dropdown.dart';
import '../../common_ui/styles.dart';

class FilterField extends StatelessWidget {
  const FilterField({
    Key? key,
    required this.items,
    required this.itemSelected,
    required this.label,
    this.initialValue,
  }) : super(key: key);

  final Set<String?> items;
  final Function(String?) itemSelected;
  final String? initialValue;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.body1,
        ),
        const SizedBox(height: 10),
        FormDropdown(
          hint: label,
          menuItems: items,
          onOptionSelected: itemSelected,
          itemSelected: initialValue,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}