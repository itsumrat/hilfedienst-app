import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_config.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/Toureplan/daily_toureplan.dart';
import 'package:hilfedienst/view/Toureplan/weekly_toureplan.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../view_controller/app_bar.dart';

class Toureplan extends StatefulWidget {
  const Toureplan({super.key});

  @override
  State<Toureplan> createState() => _ToureplanState();
}

class _ToureplanState extends State<Toureplan> {
  final snackBar = SnackBar(
    content: const Text(
        'Der Tourenplan kann sich täglich ändern und bildet nicht die tatsächliche Arbeitszeiten ab'),
    action: SnackBarAction(
      label: 'X',
      textColor: Colors.white,
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Do something
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Appbar(
              text: "Toureplan",
            )),
        body: Container( 
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "29 Aug - 3 Sept, 2022",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  TextButton(onPressed: () {}, child: Text("Show Current"))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 220,
                  child: TabBar(
                    indicator: RectangularIndicator(

                      topLeftRadius: 100,
                      topRightRadius: 100,
                      bottomLeftRadius: 100,
                      bottomRightRadius: 100,
                      color: appColors.mainColor.withOpacity(0.3),
                      paintingStyle: PaintingStyle.fill,
                    ),
                    labelColor: appColors.mainColor,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Color(0xff10384F),
                    tabs: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                            child: Text(
                          "Weekly",
                          style: TextStyle(fontSize: 15),
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                            child: Text(
                          "Daily",
                          style: TextStyle(fontSize: 15),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                    children: [
                      WeeklyToureplan(),
                      DailyToureplan(),
                    ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: size.width,
          height: 60,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 1, color: appColors.mainColor.withOpacity(0.5)))),
          padding: EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 17,
                  color: appColors.mainColor,
                ),
                Text(
                  "Prev",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: appColors.mainColor),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: appColors.mainColor),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                  color: appColors.mainColor,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
