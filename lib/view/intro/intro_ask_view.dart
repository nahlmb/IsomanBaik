import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isomanbangkit/components/IBButtonAccent.dart';
import 'package:isomanbangkit/routes/routes_name.dart';

class IntroAskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff389F6E),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 124, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                      "Selamat datang di IsomanBaik, melalui aplikasi ini kamu akan dipandu lengkap untuk mencegah Covid19 dan juga kamu akan dipandu menjalani isolasi mandiri jika kamu terpapar.",
                      style: TextStyle(color: Colors.white, fontSize: 16))
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              left: 24,
              right: 24,
              child: Container(
                width: Get.mediaQuery.size.width,
                child: IBButtonAccent(
                  "Lanjutkan",
                  onPressed: () {
                    Get.offNamed(RoutesName.PREVENT_HOME);
                  },
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
