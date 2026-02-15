import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool enabled;
  final void Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.enabled = true,
    this.onChanged,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: widget.hintText,
          hintStyle: context.text.labelLarge?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24, right: 8),
            child: Icon(Icons.search_rounded, color: Colors.grey, size: 24,),
          ),
        ),
      ),
    );
  }
}
