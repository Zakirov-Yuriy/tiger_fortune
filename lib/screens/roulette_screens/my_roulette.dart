import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';

class MyRoulette extends StatelessWidget {
  const MyRoulette({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RouletteController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: 301,
          height: 344,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(controller.animation),
            child: Image.asset(
              'assets/images/spot_roulette/roulette1.png', // Replace with your image path
              width: 301,
              height: 344,
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 129,
          child: Image.asset(
            'assets/images/spot_roulette/Group1.png', // Your existing image
            width: 67,
            height: 51,
          ),
        ),
      ],
    );
  }
}
