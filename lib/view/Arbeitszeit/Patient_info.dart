import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/utils/signature_key_to_file.dart';
import 'package:hilfedienst/view/Arbeitszeit/controller/patient_info_controller.dart';
import 'package:hilfedienst/view/Arbeitszeit/signeture.dart';
import 'package:hilfedienst/view/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

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
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

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
            title: const Text(
              "Meine Arbeitszeit",
              style: TextStyle(color: AppColors.black, fontSize: 24),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.black45,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Patient Info",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
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
                        height: 10,
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
                            "${controller.patientInfo.value?.road ?? ""}\n${controller.patientInfo.value?.postCode ?? ""} ${controller.patientInfo.value?.place ?? ""}"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Signeture(
                  signatureGlobalKey: signatureGlobalKey,
                ),
              ],
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () async {
              if (signatureGlobalKey.currentState!.toPathList().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please draw your signature"),
                  ),
                );
              } else {
                File signature = await signatureKeyToFile(signatureGlobalKey);
                var result =
                    await controller.sendBookingRequest(image: signature);
                if (result) {
                  Get.snackbar("Success!", "Booking completed successfully",
                      backgroundColor: Colors.green, colorText: Colors.white);
                  Get.offAll(
                    () => const Index(
                      index: 1,
                    ),
                    transition: Transition.zoom,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Sorry! Something went wrong."),
                    ),
                  );
                }
              }
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Confirm signature & Complete",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  File? image;
  Future uploadFile() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      log("Failed to pick image: $e");
    }
  }

  Padding buildAlignText(Size size, String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 8,
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
