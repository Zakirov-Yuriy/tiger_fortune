import 'package:flutter/material.dart';

class CustomTitle2 extends StatelessWidget {
  final String text;

  const CustomTitle2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Text(
            text.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 32,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
              height: 1.0,
              letterSpacing: -2,
              color: Color.fromRGBO(202, 34, 44, 1),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  height: 1.0,
                  letterSpacing: -2,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = const Color.fromRGBO(196, 199, 134, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
