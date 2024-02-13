import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../pause/pause_screens.dart';
import '../roulette_screens/hamburger_menu_button_widget.dart';
import '../roulette_screens/plus_minus_positioned_widget.dart';
import 'you_win_slot_screen.dart';

class SpotSlotGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/spot_roulette/bgRoulette.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [],
              ),
            ),
          ),
          Positioned(
            left: 48,
            top: 30,
            bottom: 28,
            child: Image.asset(
              'assets/images/spot_roulette/Win.png',
              width: 174,
              height: 332,
            ),
          ),
          Positioned(
            right: 40,
            bottom: 70,
            child: Image.asset(
              'assets/images/spot_roulette/Balance.png',
              width: 174,
              height: 332,
            ),
          ),
          // Добавление нового изображения
          const Positioned(
            top: 28,
            left: 183,
            bottom: 28,
            width: 497.87,
            child: Image(
              image: Svg(
                'assets/images/spot/Slot1.svg',
              ),
            ),
          ),
          // Добавление кнопки SPIN
          Positioned(
            right: 50,
            bottom: 28,
            child: ElevatedButton(
              onPressed: () {
                // Действие при нажатии на кнопку SPIN
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromRGBO(38, 121, 228, 1), // Цвет фона
                fixedSize: const Size(140, 56), // Размеры кнопки
                padding: const EdgeInsets.all(10), // Отступы внутри кнопки
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Скругление углов
                  side: const BorderSide(
                    color: Color.fromRGBO(24, 64, 134, 1), // Цвет границы
                    width: 4, // Толщина границы
                  ),
                ),
              ),
              child: const Text(
                'SPIN',
                style: TextStyle(
                  fontFamily: 'Roboto', // Шрифт
                  fontSize: 20, // Размер шрифта
                  fontWeight: FontWeight.bold, // Жирность шрифта
                  // letterSpacing: 0.01, // Межбуквенное расстояние
                  // lineHeight: 22, // Высота строки
                  // textAlign: TextAlign.left, // Выравнивание текста
                  color: Colors.white, // Цвет текста
                ),
              ),
            ),
          ),
          PlusMinusPositioned(
            onPlusPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YouWinSlotScreen()),
              );
            },
            onMinusPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YouWinSlotScreen()),
              );
            },
          ),
          HamburgerMenuButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PauseScreen()),
              );
            },
          ),
        ],
      ),
      // floatingActionButton: SpinButton(
      //   onPressed: () => _controller.rollTo(
      //     3,
      //     clockwise: _clockwise,
      //     offset: _random.nextDouble(),
      //   ),
      // ),
    );
  }
}
