import 'package:flutter/material.dart';

class HamburgerMenuButton extends StatelessWidget {
  final VoidCallback onPressed;

  const HamburgerMenuButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 19,
      top: 20,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Color.fromRGBO(24, 64, 134, 1),
              width: 4,
            ),
          ),
          backgroundColor: Color.fromRGBO(38, 121, 228, 1),
        ),
        child: Icon(
          Icons.menu,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
