import 'package:flutter/material.dart';

import '../../widgets/spot_roulette_widgets/custom_title_widget2.dart';
import '../pause/pause_screens.dart';
import 'spot_pokies_game_screen copy.dart';

class YouWinPokiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/spot/SpotPokiesGame.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 148.0, left: 100),
              child: CustomTitle2(
                text: 'Spot Pokies',
              ),
            ),
          ),
          Positioned(
            bottom: 38,
            left: 120,
            child: Image.asset(
              'assets/images/spot/Pokies.png',
              width: 164,
              height: 140,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 135),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTitle2(
                    text: 'You won',
                  ),
                  const Text(
                    '8,000',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SpotPokiesGameScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(140, 56),
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            width: 4,
                            color: Color.fromRGBO(190, 23, 23, 1),
                          ),
                        ),
                        backgroundColor: const Color.fromRGBO(238, 33, 33, 1),
                      ),
                      child: const Text(
                        'Play again',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11, bottom: 38),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PauseScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(140, 56),
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            width: 4,
                            color: Color.fromRGBO(190, 23, 23, 1),
                          ),
                        ),
                        backgroundColor: const Color.fromRGBO(238, 33, 33, 1),
                      ),
                      child: const Text(
                        'Main menu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            width: 258,
            // height: 258,
            top: 148,
            bottom: -10,
            right: 145,
            child: Image.asset(
              'assets/images/spot_roulette/imageT.png',
            ),
          ),
          Positioned(
            width: 174,
            top: 68,
            bottom: 1,
            right: 36,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset(
                'assets/images/spot_roulette/Win2.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
