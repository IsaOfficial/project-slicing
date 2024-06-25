import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          margin: const EdgeInsets.fromLTRB(
              12, 0, 12, 7), // Menambahkan margin kanan-kiri 12 dan bawah 7
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 1.6, 0, 6),
                width: 23.5,
                height: 22,
                child: SizedBox(
                  width: 23.5,
                  height: 22,
                  child: SvgPicture.asset(
                    'assets/icons/camera.svg', // Ganti dengan path lokal yang benar
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 1.6, 0, 0),
                child: SizedBox(
                  width: 105,
                  height: 28,
                  child: SvgPicture.asset(
                    'assets/images/instagram_logo.svg', // Ganti dengan path lokal yang benar
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.6),
                child: SizedBox(
                  width: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 18.3, 0),
                        child: SizedBox(
                          width: 24,
                          height: 25,
                          child: SvgPicture.asset(
                            'assets/icons/igtv.svg', // Ganti dengan path lokal yang benar
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 3.2, 0, 2),
                        width: 22.7,
                        height: 19.8,
                        child: SizedBox(
                          width: 22.7,
                          height: 19.8,
                          child: SvgPicture.asset(
                            'assets/icons/messenger.svg', // Ganti dengan path lokal yang benar
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
