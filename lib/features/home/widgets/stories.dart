import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Example of story widget
          StoryWidget(
            imagePath: 'assets/images/my_profile.jpg',
            username: 'Your Story',
          ),
          StoryWidget(
            imagePath: 'assets/images/karennne.jpg',
            username: 'karennne',
            isLive: true,
          ),
          StoryWidget(
            imagePath: 'assets/images/zackjohn.jpg',
            username: 'zackjohn',
          ),
          StoryWidget(
            imagePath: 'assets/images/kieron_d.jpg',
            username: 'kieron_d',
          ),
          StoryWidget(
            imagePath: 'assets/images/craig_love.jpg',
            username: 'craig_love',
          ),
        ],
      ),
    );
  }
}

class StoryWidget extends StatelessWidget {
  final String imagePath;
  final String username;
  final bool isLive;

  const StoryWidget({
    super.key,
    required this.imagePath,
    required this.username,
    this.isLive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                width: 62,
                height: 62,
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
              if (isLive)
                Positioned(
                  right: -5.8,
                  top: 3,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFFEFEFE)),
                      borderRadius: BorderRadius.circular(3),
                      gradient: const LinearGradient(
                        begin: Alignment(-1.629, 0.386),
                        end: Alignment(0.24, 1.737),
                        colors: <Color>[
                          Color(0xFFC90083),
                          Color(0xFFD22463),
                          Color(0xFFE10038)
                        ],
                        stops: <double>[0, 0.224, 1],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'LIVE',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w500,
                          fontSize: 8,
                          letterSpacing: 0.5,
                          color: const Color(0xFFFEFEFE),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(6.7, 0, 6.7, 0),
            child: Text(
              username,
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 0,
                color: const Color(0xFF262626),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
