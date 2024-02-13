import 'package:flutter/material.dart';
import '../../widgets/spot_roulette_widgets/customIcon_button_widget.dart';
import '../../widgets/spot_roulette_widgets/custom_elevated_button_widget.dart';
import '../../widgets/spot_roulette_widgets/custom_title_widget.dart';
import '../roulette_screens/spot_roulette_screen.dart';
import '../tiger_fortune_screen.dart';
import 'spot_pokies_game_screen copy.dart';

class SpotPokiesScreen extends StatelessWidget {
  const SpotPokiesScreen({super.key});

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
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Image.asset(
                        'assets/images/spot/Pokies.png',
                        width: 260.34,
                        height: 180,
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
                              builder: (context) => const SpotRouletteScreen()),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TigerFortuneScreen()),
                );
              },
            ),
          ),
          // ignore: prefer_const_constructors
          CustomTitle(
            text: 'Spot Pokies',
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
                        builder: (context) => SpotPokiesGameScreen()),
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
