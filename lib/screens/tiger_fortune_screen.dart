import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'daily_reward/daily_reward_screen.dart';
import 'settings_screens/settings_screens.dart';
import 'roulette_screens/spot_roulette_screen.dart';

class TigerFortuneScreen extends StatefulWidget {
  @override
  _TigerFortuneScreenState createState() => _TigerFortuneScreenState();
}

class _TigerFortuneScreenState extends State<TigerFortuneScreen> {
  late bool isButtonIcon1 = true; // Переменная для отслеживания текущей иконки
  bool rewardOpened = false;
  bool timerStarted = false;
  late DateTime startTime;
  late Timer? timer;
  String timerText = '';

  void _toggleIcon() {
    setState(() {
      isButtonIcon1 = !isButtonIcon1;
    });
  }

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now();
    timerText = '';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 0), (Timer t) {
      updateTimer();
    });
  }

  void updateTimer() {
    Duration difference = DateTime.now().difference(startTime);
    Duration remainingTime = const Duration(days: 1) - difference;
    if (remainingTime.isNegative) {
      setState(() {
        rewardOpened = true;
        timerText = '';
      });
      timer?.cancel();
      return;
    }
    setState(() {
      int hours = remainingTime.inHours % 24;
      int minutes = remainingTime.inMinutes % 60;
      int seconds = remainingTime.inSeconds % 60;
      timerText =
          ' ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tiger_fortune/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            width: 330,
            height: 349,
            bottom: -30,
            left: 34,
            child: Image.asset(
              'assets/images/tiger_fortune/tiger.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0, left: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
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
                        child: GestureDetector(
                          onTap: _toggleIcon,
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
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsScreen()),
                            );
                          },
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 43,
            child: Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Text(
                    'Tiger \nfortune'.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 48,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                      letterSpacing: -6,
                      color: Color.fromRGBO(202, 34, 44, 1),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Tiger \nfortune'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 48,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          letterSpacing: -6,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = const Color.fromRGBO(196, 199, 134, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 104,
            top: 60,
            width: 103,
            height: 137,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DailyRewardScreen()),
                );
              },
              child: Image.asset(
                rewardOpened
                    ? 'assets/images/tiger_fortune/EnvelopeOpen.png'
                    : 'assets/images/tiger_fortune/envelope.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            right: 57,
            bottom: 153,
            child: Center(
              child: Stack(
                children: [
                  Text(
                    'Daily Reward'.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                      letterSpacing: -4,
                      color: Color.fromRGBO(202, 34, 44, 1),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Daily Reward'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          letterSpacing: -4,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = const Color.fromRGBO(196, 199, 134, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 45,
            bottom: 114,
            child: SizedBox(
              width: 160,
              height: 38,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: rewardOpened
                            ? 'You can open daily reward in'
                            : 'Your daily reward is ready.',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 19 / 16,
                          letterSpacing: 0,
                          color: Colors
                              .white, // Белый цвет для текста "You can open daily reward in"
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
                          color: Color.fromRGBO(
                              38, 121, 228, 1), // Цвет для цифр таймера
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 45,
            bottom: 26,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (!rewardOpened) {
                    rewardOpened = true;
                    startTime = DateTime.now();
                    timerStarted =
                        true; // Устанавливаем флаг, что таймер запущен
                    startTimer(); // Запускаем таймер
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(162, 56),
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    width: 4,
                    color: Color.fromRGBO(24, 64, 134, 1),
                  ),
                ),
                backgroundColor: const Color.fromRGBO(38, 121, 228, 1),
                elevation: 0,
              ),
              child: Text(
                rewardOpened ? 'Reset timer' : 'Open reward',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Навигация на экран SpotRouletteScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpotRouletteScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(241, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                          width: 4,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: const Color.fromRGBO(238, 33, 33, 1),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Spots',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Закрытие приложения
                      SystemNavigator.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(241, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                          width: 4,
                          color: Color.fromRGBO(190, 23, 23, 1),
                        ),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: const Color.fromRGBO(238, 33, 33, 1),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Exit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
