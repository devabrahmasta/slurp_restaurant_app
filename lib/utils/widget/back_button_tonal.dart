import 'package:flutter/material.dart';

class BackButtonTonal extends StatelessWidget {
  const BackButtonTonal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      style: IconButton.styleFrom(
        backgroundColor: Colors.black38,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_rounded,
        color: Colors.white,
      ),
    );
  }
}
