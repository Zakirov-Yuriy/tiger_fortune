import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomBottomMenu extends StatelessWidget {
  final bool isButtonIcon1;
  final VoidCallback onToggleIcon;
  final VoidCallback onSettingsPressed;

  const CustomBottomMenu({
    required this.isButtonIcon1,
    required this.onToggleIcon,
    required this.onSettingsPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onToggleIcon,
                  child: Container(
                    width: 49,
                    height: 48,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 33, 33, 1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 4,
                        color: const Color.fromRGBO(190, 23, 23, 1),
                      ),
                    ),
                    child: isButtonIcon1
                        ? const Image(
                            width: 24,
                            height: 24,
                            image: Svg('assets/icons/Buttons.svg'),
                          )
                        : const Image(
                            width: 24,
                            height: 24,
                            image: Svg('assets/icons/ButtonsOff.svg'),
                          ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onSettingsPressed,
                  child: Container(
                    width: 49,
                    height: 48,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 33, 33, 1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 4,
                        color: const Color.fromRGBO(190, 23, 23, 1),
                      ),
                    ),
                    child: const Image(
                      width: 24,
                      height: 24,
                      image: Svg(
                          'assets/icons/settings.svg'), // Путь к вашей иконке
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
