import 'package:flutter/material.dart';

import '../../widgets/spot_roulette_widgets/customIcon_button_widget.dart';
import '../../widgets/spot_roulette_widgets/custom_elevated_button_widget.dart';
import '../../widgets/spot_roulette_widgets/custom_title_widget.dart';
import '../spot_slot_screen/spot_slot_screen.dart';
import 'roulette_screen.dart';

class SpotRouletteScreen extends StatelessWidget {
  const SpotRouletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Фоновое изображение, если необходимо
          Positioned.fill(
            child: Image.asset(
              'assets/images/spot/bg2.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Стрелка назад
                    CustomIconButton(
                      backgroundColor: const Color.fromRGBO(238, 33, 33, 1),
                      borderColor: const Color.fromRGBO(190, 23, 23, 1),
                      iconData: Icons.arrow_back,
                      iconColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    // Изображение
                    Padding(
                      padding: const EdgeInsets.only(left: 87, right: 87),
                      child: Image.asset(
                        'assets/images/spot/roulette.png',
                        width: 176.34,
                        height: 261,
                      ),
                    ),

                    CustomIconButton(
                      backgroundColor: const Color.fromRGBO(238, 33, 33, 1),
                      borderColor: const Color.fromRGBO(190, 23, 23, 1),
                      iconData: Icons.arrow_forward,
                      iconColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SpotSlotScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: 24,
            left: 62,
            child: CustomIconButton(
              backgroundColor: const Color.fromRGBO(38, 121, 228, 1),
              borderColor: const Color.fromRGBO(24, 64, 134, 1),
              iconData: Icons.arrow_back,
              iconColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // ignore: prefer_const_constructors
          CustomTitle(
            text: 'Spot\nRoulette',
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 32.0), // Расстояние от нижнего края экрана
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RouletteScreen()),
                  );
                  // Обработка нажатия кнопки "Play"
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
