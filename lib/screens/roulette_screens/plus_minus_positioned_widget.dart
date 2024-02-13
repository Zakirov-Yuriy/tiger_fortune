import 'package:flutter/material.dart';

class PlusMinusPositioned extends StatelessWidget {
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;

  const PlusMinusPositioned({
    super.key,
    required this.onPlusPressed,
    required this.onMinusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 50,
      bottom: 114,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: onMinusPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(68, 56),
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color.fromRGBO(190, 23, 23, 1),
                  width: 4,
                ),
              ),
              backgroundColor: const Color.fromRGBO(238, 33, 33, 1),
              elevation: 0,
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: onPlusPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(68, 56),
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color.fromRGBO(190, 23, 23, 1),
                  width: 4,
                ),
              ),
              backgroundColor: const Color.fromRGBO(238, 33, 33, 1),
              elevation: 0,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
