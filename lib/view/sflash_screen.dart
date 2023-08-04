import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hilfedienst/app_config.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/login.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class SflashScreen extends StatefulWidget {
  const SflashScreen({Key? key}) : super(key: key);

  @override
  State<SflashScreen> createState() => _SflashScreenState();
}

class _SflashScreenState extends State<SflashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 2000)).then((value) => Get.to(
          Login(),
          transition: Transition.zoom,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: appColors.mainColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/falshicon.png",
              height: 80,
              width: 100,
            ),
            Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Bobbers',
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Hilfedienst'),
                  ],
                  totalRepeatCount: 1,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
