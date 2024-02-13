import 'package:flutter/material.dart';

class SpinButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SpinButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 56,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: const Color.fromRGBO(38, 121, 228, 1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: Color.fromRGBO(24, 64, 134, 1),
            width: 4,
          ),
        ),
        child: const Text(
          'SPIN',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.01,
            height: 22 / 20,
          ),
        ),
      ),
    );
  }
}
