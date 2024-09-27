import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:viceversa/utils/theme.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final List<String> imgList = [
      'assets/images/welcome-image1.jpg',
      'assets/images/welcome-image2.jpg',
      'assets/images/welcome-image3.jpg',
      'assets/images/welcome-image4.jpg',
    ];

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            enlargeCenterPage: false,
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            height: MediaQuery.of(context).size.height,
          ),
          items: imgList
              .map((item) => Image.asset(
            item,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ))
              .toList(),
        ),
        Positioned
          (
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.darkColorTheme.surface.withOpacity(0.1),
                      AppTheme.darkColorTheme.surface.withOpacity(0.4),
                      AppTheme.darkColorTheme.surface.withOpacity(0.6),
                      AppTheme.darkColorTheme.surface.withOpacity(0.8),
                      AppTheme.darkColorTheme.surface.withOpacity(1.0),
                    ],
                    stops: [0.0, 0.3, 0.4, 0.5, 0.7],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Style Redefined: ",
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppTheme.darkColorTheme.onSecondary
                                )
                                ),
                            TextSpan(
                              text: "Trendy Fashion Wardrobe",
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppTheme.lightColorTheme.onPrimary
                              )
                            ),
                            TextSpan(
                              text:
                              "\nExplore your style with our chic, versatile essentials and trends.",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppTheme.lightColorTheme.onPrimary)

                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text('Login'),
                              style: AppTheme.darkTheme.elevatedButtonTheme.style
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text('Register'),
                              style: AppTheme.darkTheme.outlinedButtonTheme.style
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ]),
              )),
        ),
      ],
    );
  }
}
