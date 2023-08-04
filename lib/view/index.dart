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
  Index({this.index = 0});
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List pages = [
    Home(),
    Arbeitszeit(),
    Besuche(),
    Menu(),
    PatinetInfo(),
  ];

  int currentPage = 0;

  void checkIndex() {
    if (widget.index != 0 && widget.index != null) {
      setState(() {
        currentPage = widget.index!;
      });
    }
    print(currentPage);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIndex();
    print("index page ${currentPage}");
    titleCheck();
    isHome = true;
    isArbeitszeit = false;
    isBesuche = false;
    isMehr = false;
    print("isArbeitszeit ${isArbeitszeit}");
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

    print(isHome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: CurvedNavigationBar(
        height: 75.0,
        backgroundColor: appColors.white,
        color: appColors.mainColor,
        buttonBackgroundColor: appColors.mainColor,
        items: <Widget>[
          Container(
            margin: isHome ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  size: 30,
                  color: appColors.white,
                ),
                isHome ? SizedBox.shrink() : buildBottomMenuText("Home"),
              ],
            ),
          ),
          Container(
            margin: isArbeitszeit
                ? EdgeInsets.only(top: 0)
                : EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Icon(
                  Icons.watch_later,
                  size: 30,
                  color: appColors.white,
                ),
                isArbeitszeit
                    ? SizedBox.shrink()
                    : buildBottomMenuText("Arbeitszeit"),
              ],
            ),
          ),
          Container(
            margin:
                isBesuche ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Icon(
                  FontAwesomeIcons.globe,
                  size: 30,
                  color: appColors.white,
                ),
                isBesuche ? SizedBox.shrink() : buildBottomMenuText("Besuche"),
              ],
            ),
          ),
          Container(
            margin: isMehr ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: appColors.white,
                ),
                isMehr ? SizedBox.shrink() : buildBottomMenuText("Mehr"),
              ],
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
            print(currentPage);
            titleCheck();
          });
        },
      ),
    );
  }

  Text buildBottomMenuText(title) {
    return Text(
      "$title",
      style: TextStyle(fontWeight: FontWeight.w600, color: appColors.white),
    );
  }
}
