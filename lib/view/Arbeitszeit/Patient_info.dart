import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/Arbeitszeit/signeture.dart';
import 'package:hilfedienst/view/index.dart';
import 'package:hilfedienst/view_controller/title_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class PatinetInfo extends StatefulWidget {
  const PatinetInfo({Key? key}) : super(key: key);

  @override
  State<PatinetInfo> createState() => _PatinetInfoState();
}

class _PatinetInfoState extends State<PatinetInfo> {
  int sec = 0, hr = 0, mm = 0;
  final stopwatch = Stopwatch();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.

  bool _isStart = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appColors.white,
          leading: IconButton(
            onPressed: () {
              Get.to(
                  Index(
                    index: 1,
                  ),
                  transition: Transition.rightToLeft);
              print("click");
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: appColors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                TitleText(text: "Meine Arbeitszeit"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: appColors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                          color: appColors.grey)
                    ],
                  ),
                  child: Column(
                    children: [
                      buildAlignText(size, "Today", "Thu, 29 Sep 2022"),
                      SizedBox(
                        height: 20,
                      ),
                      buildAlignText(size, "Time", "9:00 PM"),
                      SizedBox(
                        height: 20,
                      ),
                      buildAlignText(size, "Duration", "1.5 Hours"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: appColors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                          color: appColors.grey)
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Patient Info",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.to(
                                Index(
                                  index: 1,
                                ),
                                transition: Transition.rightToLeft),
                            child: Text(
                              "Change",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildAlignText(size, "Name", "nayon Talukder"),
                      SizedBox(
                        height: 15,
                      ),
                      buildAlignText(
                          size, "Address", "67112 Mutterstadt Blockfeld 4"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: size.width,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF2F7),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hours",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff10384F),
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                "Minutes",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff10384F),
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                "Secound",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff10384F),
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    color: appColors.black),
                                children: [
                              TextSpan(text: "00 : "),
                              TextSpan(text: "00 : "),
                              TextSpan(text: "00")
                            ])),
                        SizedBox(
                          height: 20,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     // StreamBuilder<int>(
                        //     //     stream: _stopWatchTimer.rawTime,
                        //     //     initialData: 0,
                        //     //     builder: (context, snap) {
                        //     //       final value = snap.data;
                        //     //       print(value);
                        //     //       final displayTime = StopWatchTimer.getDisplayTime(value!);

                        //     //     return Text("${displayTime.toString()}",
                        //     //       style:  TextStyle(
                        //     //           fontSize: 55,
                        //     //           fontWeight: FontWeight.bold,
                        //     //           color: appColors.black
                        //     //       ),
                        //     //     );
                        //     //   }
                        //     // ),
                        //   ],
                        // ),
                      ],
                    )),
              ]),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: InkWell(
            onTap: () {
              Get.to(Signeture(), transition: Transition.rightToLeft);
              print("object");
              setState(() {
                _isStart = !_isStart;
              });
              if (_isStart == true) {
                _stopWatchTimer.onStopTimer();
              } else {
                // Start timer.
                _stopWatchTimer.onStartTimer();
              }
            },
            hoverColor: appColors.mainColor.withOpacity(0.1),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(width: 2, color: appColors.mainColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isStart ? Icons.play_arrow : Icons.stop,
                    color: appColors.mainColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    _isStart ? "Start Booking" : "Stop Booking",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: appColors.mainColor,
                        fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildAlignText(Size size, String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width / 2.5,
            child: Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          SizedBox(
            width: size.width / 3,
            child: Text(
              "$subTitle",
              overflow: TextOverflow.clip,
              textAlign: TextAlign.end,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
