import 'package:flutter/material.dart';

class RewardButton extends StatelessWidget {
  final bool rewardOpened;
  final VoidCallback onPressed;

  const RewardButton({
    Key? key,
    required this.rewardOpened,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 95,
      bottom: 38,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(162, 56),
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              width: 4,
              color: rewardOpened
                  ? const Color.fromRGBO(128, 128, 128, 1)
                  : const Color.fromRGBO(24, 64, 134, 1),
            ),
          ),
          backgroundColor: rewardOpened
              ? const Color.fromRGBO(181, 181, 181, 1)
              : const Color.fromRGBO(38, 121, 228, 1),
          elevation: 0,
        ),
        child: Text(
          rewardOpened ? 'Open' : 'Open',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
