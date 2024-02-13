import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final IconData iconData;
  final Color iconColor;
  final VoidCallback? onPressed; // Обработчик нажатия кнопки

  const CustomIconButton({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconData,
    required this.iconColor,
    this.onPressed, // Используем опциональный параметр
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: 4,
        ),
      ),
      child: IconButton(
        onPressed: onPressed, // Передаем обработчик нажатия
        icon: Icon(
          iconData,
          size: 32,
          color: iconColor,
        ),
        padding: EdgeInsets.all(8),
        iconSize: 32,
        splashRadius: 24,
      ),
    );
  }
}
