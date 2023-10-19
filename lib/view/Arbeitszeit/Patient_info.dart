import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/Arbeitszeit/controller/patient_info_controller.dart';
import 'package:hilfedienst/view/Arbeitszeit/signeture.dart';
import 'package:hilfedienst/view/index.dart';
import 'package:hilfedienst/view_controller/title_text.dart';
import 'package:intl/intl.dart';
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
  final controller = Get.find<PatientInfoController>();

  bool _isStart = true;

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  void initState() {
    // _stopWatchTimer.setPresetHoursTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<PatientInfoController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.white,
            leading: IconButton(
              onPressed: () {
                Get.off(
                    () => const Index(
                          index: 1,
                        ),
                    transition: Transition.rightToLeft);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const TitleText(text: "Meine Arbeitszeit"),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                          color: AppColors.grey)
                    ],
                  ),
                  child: Column(
                    children: [
                      // buildAlignText(size, "Today", "Thu, 29 Sep 2022"),
                      buildAlignText(size, "Today",
                          DateFormat.yMMMd().format(DateTime.now())),
                      const SizedBox(
                        height: 20,
                      ),
                      StatefulBuilder(builder: (context, setState) {
                        Timer.periodic(const Duration(seconds: 1), (timer) {
                          if (mounted) {
                            setState(() {});
                          }
                        });
                        return buildAlignText(
                            size,
                            "Time", // "10:00:00 AM",
                            DateFormat('hh:mm:ss a').format(DateTime.now()));
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      buildAlignText(
                          size, "Duration", controller.hour.toString()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                          color: AppColors.grey)
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Patient Info",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.to(
                                () => const Index(
                                      index: 1,
                                    ),
                                transition: Transition.rightToLeft),
                            child: const Text(
                              "Change",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => buildAlignText(size, "Name",
                            "${controller.patientInfo.value?.firstName ?? ""} ${controller.patientInfo.value?.lastName ?? ""}"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => buildAlignText(size, "Address",
                            controller.patientInfo.value?.address ?? ""),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Container(
                //     width: size.width,
                //     padding: const EdgeInsets.all(20),
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFEFF2F7),
                //       borderRadius: BorderRadius.circular(
                //         10,
                //       ),
                //     ),
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 30, right: 30),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: const [
                //               Text(
                //                 "Hours",
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   color: Color(0xff10384F),
                //                   fontSize: 17,
                //                 ),
                //               ),
                //               Text(
                //                 "Minutes",
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   color: Color(0xff10384F),
                //                   fontSize: 17,
                //                 ),
                //               ),
                //               Text(
                //                 "Secound",
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   color: Color(0xff10384F),
                //                   fontSize: 17,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         const SizedBox(
                //           height: 30,
                //         ),
                //         // RichText(
                //         //     text: const TextSpan(
                //         //         style: TextStyle(
                //         //             fontSize: 45,
                //         //             fontWeight: FontWeight.bold,
                //         //             color: AppColors.black),
                //         //         children: [
                //         //       TextSpan(text: "00 : "),
                //         //       TextSpan(text: "00 : "),
                //         //       TextSpan(text: "00")
                //         //     ])),
                //         const SizedBox(
                //           height: 20,
                //         ),
                //         // Row(
                //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         //   children: [
                //         //     // StreamBuilder<int>(
                //         //     //     stream: _stopWatchTimer.rawTime,
                //         //     //     initialData: 0,
                //         //     //     builder: (context, snap) {
                //         //     //       final value = snap.data;
                //         //     //
                //         //     //       final displayTime = StopWatchTimer.getDisplayTime(value!);

                //         //     //     return Text("${displayTime.toString()}",
                //         //     //       style:  TextStyle(
                //         //     //           fontSize: 55,
                //         //     //           fontWeight: FontWeight.bold,
                //         //     //           color: appColors.black
                //         //     //       ),
                //         //     //     );
                //         //     //   }
                //         //     // ),
                //         //   ],
                //         // ),
                //       ],
                //     )),
              ],
            ),
          ),
          bottomNavigationBar: !_isStart
              ? null
              : Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: InkWell(
                    onTap: () async {
                      Get.to(() => const Signeture(),
                          transition: Transition.rightToLeft);

                      setState(() {
                        _isStart = !_isStart;
                      });
                      if (_isStart == true) {
                        _stopWatchTimer.onStopTimer();
                      } else {
                        _stopWatchTimer.onStartTimer();
                      }
                    },
                    hoverColor: AppColors.mainColor.withOpacity(0.1),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border:
                            Border.all(width: 2, color: AppColors.mainColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isStart ? Icons.play_arrow : Icons.stop,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            _isStart ? "Start Booking" : "Stop Booking",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainColor,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      );
    });
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
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          SizedBox(
            width: size.width / 3,
            child: Text(
              subTitle,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
