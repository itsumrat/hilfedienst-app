import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/Arbeitszeit/Patient_info.dart';
import 'package:hilfedienst/view/Arbeitszeit/arbeitszeit.dart';
import 'package:hilfedienst/view/home.dart';
import 'package:hilfedienst/view/menu.dart';

import 'besuche/besuche.dart';

class Index extends StatefulWidget {
  final int? index;
  const Index({super.key, this.index = 0});
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List pages = [
    const Home(),
    const Arbeitszeit(),
    const Besuche(),
    const Menu(),
    const PatinetInfo(),
  ];

  late int currentPage;

  void checkIndex() {
    if (widget.index != 0 && widget.index != null) {
      setState(() {
        currentPage = widget.index!;
      });
    }
  }

  @override
  void initState() {
    currentPage = widget.index ?? 0;

    isHome = false;
    isArbeitszeit = false;
    isBesuche = false;
    isMehr = false;
    checkIndex();
    titleCheck();
    super.initState();
  }

  bool isHome = false;
  bool isArbeitszeit = false;
  bool isBesuche = false;
  bool isMehr = false;

  void titleCheck() {
    if (currentPage == 0) {
      setState(() {
        isHome = true;
      });
    } else {
      setState(() {
        isHome = false;
      });
    }

    ///isArbeitszeit check
    if (currentPage == 1) {
      setState(() {
        isArbeitszeit = true;
      });
    } else {
      setState(() {
        isArbeitszeit = false;
      });
    }

    ///isBesuche check
    if (currentPage == 2) {
      setState(() {
        isBesuche = true;
      });
    } else {
      setState(() {
        isBesuche = false;
      });
    }

    ///isBesuche check
    if (currentPage == 3) {
      setState(() {
        isMehr = true;
      });
    } else {
      setState(() {
        isMehr = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: CurvedNavigationBar(
        height: 75.0,
        backgroundColor: AppColors.white,
        color: AppColors.mainColor,
        buttonBackgroundColor: AppColors.mainColor,
        index: currentPage,
        items: <Widget>[
          Container(
            margin: isHome
                ? const EdgeInsets.only(top: 0)
                : const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Icon(
                  Icons.home,
                  size: 30,
                  color: AppColors.white,
                ),
                isHome ? const SizedBox.shrink() : buildBottomMenuText("Home"),
              ],
            ),
          ),
          Container(
            margin: isArbeitszeit
                ? const EdgeInsets.only(top: 0)
                : const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Icon(
                  Icons.watch_later,
                  size: 30,
                  color: AppColors.white,
                ),
                isArbeitszeit
                    ? const SizedBox.shrink()
                    : buildBottomMenuText("Arbeitszeit"),
              ],
            ),
          ),
          Container(
            margin: isBesuche
                ? const EdgeInsets.only(top: 0)
                : const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Icon(
                  FontAwesomeIcons.globe,
                  size: 30,
                  color: AppColors.white,
                ),
                isBesuche
                    ? const SizedBox.shrink()
                    : buildBottomMenuText("Besuche"),
              ],
            ),
          ),
          Container(
            margin: isMehr
                ? const EdgeInsets.only(top: 0)
                : const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: AppColors.white,
                ),
                isMehr ? const SizedBox.shrink() : buildBottomMenuText("Mehr"),
              ],
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;

            titleCheck();
          });
        },
      ),
    );
  }

  Text buildBottomMenuText(title) {
    return Text(
      "$title",
      style:
          const TextStyle(fontWeight: FontWeight.w600, color: AppColors.white),
    );
  }
}
