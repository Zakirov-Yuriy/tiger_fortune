import 'package:flutter/material.dart';

class RewardTextWidget extends StatelessWidget {
  final bool rewardOpened;

  const RewardTextWidget({
    Key? key,
    required this.rewardOpened,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: rewardOpened ? 'We give you ' : 'Every ',
            style: const TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 19 / 16,
              letterSpacing: 0,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: rewardOpened ? '200 coins' : '24 hours',
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 16 /
                  16, // Убедитесь, что вы используете правильное значение высоты для вашего шрифта
              letterSpacing: 0,
              color: rewardOpened
                  ? const Color.fromRGBO(238, 33, 33, 1) // Красный цвет
                  : const Color.fromRGBO(38, 121, 228, 1), // Синий цвет
            ),
          ),
          TextSpan(
            text: rewardOpened
                ? ' for daily login to the application. We are waiting for you.'
                : ' you \ncan get your daily reward.',
            style: const TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 19 / 16,
              letterSpacing: 0,
              color: Colors.white,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}
