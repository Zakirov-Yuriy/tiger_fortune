import 'package:flutter/material.dart';
import 'package:tiger_fortune/screens/settings_screens/custom_button_%20settings.dart';
import 'package:tiger_fortune/widgets/spot_roulette_widgets/custom_title_widget.dart';
import '../../widgets/custom_bottom_menu_widget.dart';
import '../settings_screens/settings_screens.dart';
import '../tiger_fortune_screen.dart';

class PauseScreen extends StatefulWidget {
  const PauseScreen({Key? key}) : super(key: key);

  @override
  _PauseScreenState createState() => _PauseScreenState();
}

class _PauseScreenState extends State<PauseScreen> {
  String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(83, 31, 31, 1), // Фон экрана
        ),
        child: Stack(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: CustomTitle(
                    text: 'Pause',
                  ),
                ),
                SizedBox(
                    height:
                        310), // Пространство для размещения CustomBottomMenu
              ],
            ),
            Positioned(
              top: 310,
              bottom: 32,
              left: 62,
              child: CustomBottomMenu(
                isButtonIcon1: true,
                onToggleIcon: () {},
                onSettingsPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                },
              ),
            ),
            Positioned.fill(
              top: 155,
              bottom: 32,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CustomButton(
                        buttonText: 'Continue',
                        onPressed: () {
                          Navigator.pop(
                              context); // Возвращаемся на предыдущий экран
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CustomButton(
                        buttonText: 'To main',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TigerFortuneScreen()),
                          );
                          // Обработка нажатия кнопки
                        },
                      ),
                    ),
                    CustomButton(
                      buttonText: 'Exit',
                      onPressed: () {
                        Navigator.pop(context); //

                        // Обработка нажатия кнопки
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
