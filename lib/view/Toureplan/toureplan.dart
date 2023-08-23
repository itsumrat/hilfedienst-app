import 'package:flutter/material.dart';
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
    Future.delayed(const Duration(milliseconds: 100), () {
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
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Appbar(
              text: "Toureplan",
            )),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "29 Aug - 3 Sept, 2022",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text("Show Current"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 220,
                  child: TabBar(
                    indicator: RectangularIndicator(
                      topLeftRadius: 100,
                      topRightRadius: 100,
                      bottomLeftRadius: 100,
                      bottomRightRadius: 100,
                      color: AppColors.mainColor.withOpacity(0.3),
                      paintingStyle: PaintingStyle.fill,
                    ),
                    labelColor: AppColors.mainColor,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: const Color(0xff10384F),
                    tabs: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                            child: Text(
                          "Weekly",
                          style: TextStyle(fontSize: 15),
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: const Center(
                            child: Text(
                          "Daily",
                          style: TextStyle(fontSize: 15),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: TabBarView(children: [
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
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 1, color: AppColors.mainColor.withOpacity(0.5)))),
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 17,
                  color: AppColors.mainColor,
                ),
                Text(
                  "Prev",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.mainColor),
                )
              ],
            ),
            Row(
              children: const [
                Text(
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.mainColor),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                  color: AppColors.mainColor,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
