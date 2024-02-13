import 'package:flutter/material.dart';

class RewardMessage extends StatelessWidget {
  final bool rewardOpened;
  final String timerText;

  const RewardMessage({
    required this.rewardOpened,
    required this.timerText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 38,
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: rewardOpened ? 'You can open daily reward in' : '',
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
                text: '$timerText',
                style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 19 / 16,
                  letterSpacing: 0,
                  color: Color.fromRGBO(38, 121, 228, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
