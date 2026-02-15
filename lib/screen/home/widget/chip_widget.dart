  import 'package:flutter/material.dart';
  import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

  class CustomChip extends StatelessWidget {
    final String label;
    final bool isSelected;
    final VoidCallback onTap;
    final IconData? icon;

    const CustomChip({
      Key? key,
      required this.label,
      required this.isSelected,
      required this.onTap,
      this.icon,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final selectedColor = Theme.of(context).colorScheme.primaryContainer;
      final unselectedColor = Colors.white;
      final selectedText = Colors.white;
      final unselectedText = Colors.grey.shade600;

      return ChoiceChip(
        onSelected: (value) => onTap(),
        showCheckmark: false,
        selected: isSelected,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        backgroundColor: unselectedColor,
        selectedColor: selectedColor,
        avatar: Icon(icon, color: isSelected ? selectedText : unselectedText),
        shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade200)),
        label: Text(label),
        labelStyle: context.text.labelSmall?.copyWith(color: isSelected ? selectedText : unselectedText),
      );
    }
  }
