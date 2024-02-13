import 'package:flutter/material.dart';
import 'package:tiger_fortune/screens/settings_screens/custom_button_%20settings.dart';
import 'package:tiger_fortune/screens/settings_screens/text_with_switch.dart';
import 'package:tiger_fortune/widgets/spot_roulette_widgets/customIcon_button_widget.dart';
import 'package:tiger_fortune/widgets/spot_roulette_widgets/custom_title_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(83, 31, 31, 1), // Фон экрана
        ),
        // padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 62, top: 32),
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
                const Padding(
                  padding: EdgeInsets.only(top: 32, left: 185),
                  child: CustomTitle(
                    text: 'Settings',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 153, top: 60),
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: CustomButton(
                              buttonText: 'Share with friends',
                              onPressed: () {
                                // Обработка нажатия кнопки
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: CustomButton(
                              buttonText: 'Privacy Policy',
                              onPressed: () {
                                // Обработка нажатия кнопки
                              },
                            ),
                          ),
                          CustomButton(
                            buttonText: 'Terms of use',
                            onPressed: () {
                              // Обработка нажатия кнопки
                            },
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWithSwitch(),
                        const Text(
                          'App icon',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                              color: Colors.white),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 16, top: 8),
                                child: Row(
                                  children: [
                                    _buildImageButton(
                                        'assets/images/avatars/avatar_4.png'),
                                    SizedBox(width: 16),
                                    _buildImageButton(
                                        'assets/images/avatars/avatar_0.png'),
                                    SizedBox(width: 16),
                                    _buildImageButton(
                                        'assets/images/avatars/avatar_1.png'),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  _buildImageButton(
                                      'assets/images/avatars/avatar_2.png'),
                                  SizedBox(width: 16),
                                  _buildImageButton(
                                      'assets/images/avatars/avatar_3.png'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageButton(String imagePath) {
    bool isSelected = imagePath == selectedImagePath;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImagePath = imagePath;
        });
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: Color.fromRGBO(238, 33, 33, 1), width: 4)
              : null,
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
