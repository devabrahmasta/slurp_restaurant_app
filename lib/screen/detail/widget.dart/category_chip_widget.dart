import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class CategoryWidget extends StatelessWidget {
  final String text;
  final Color backgroundRating;
  final Color border;
  final Color iconColor;

  const CategoryWidget({
    super.key,
    required this.text,
    required this.backgroundRating,
    required this.border,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: border),
          color: backgroundRating,
        ),
        child: Text(
          text,
          style: context.text.bodyMedium?.copyWith(
            color: iconColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
