import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/Arbeitszeit/Patient_info.dart';
import 'package:hilfedienst/view/Arbeitszeit/controller/arbeitszeit_controller.dart';
import 'package:hilfedienst/view/Arbeitszeit/controller/patient_info_controller.dart';
import 'package:hilfedienst/view_controller/title_text.dart';
import 'package:intl/intl.dart';

class Arbeitszeit extends StatefulWidget {
  const Arbeitszeit({Key? key}) : super(key: key);

  @override
  State<Arbeitszeit> createState() => _ArbeitszeitState();
}

class _ArbeitszeitState extends State<Arbeitszeit> {
  final ArbeitzeitController controller = Get.put(ArbeitzeitController());
  final hours = const <double>[1.5, 2, 2.5, 3, 3.5, 4];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Select Patient",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              controller.obx(
                (state) => InkWell(
                  onTap: () {
                    _showMyDialog();
                  },
                  child: Container(
                    color: const Color(0xFFEFF2F7),
                    child: ListTile(
                      title: Obx(
                        () => Text(
                          controller.selectedPatient.value != null
                              ? "${controller.selectedPatient.value!.firstName} ${controller.selectedPatient.value!.lastName}"
                              : "Select Patient",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.person,
                          color: AppColors.black,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
                onError: (error) => const Center(
                  child: Text("Error"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select Care Duration",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: hours.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      if (controller.selectedPatient.value == null) {
                        Get.snackbar(
                          "Sorry!",
                          "Please select patient",
                          backgroundColor: AppColors.mainColor,
                          colorText: AppColors.white,
                        );
                      } else {
                        Get.offAll(const PatinetInfo(),
                            transition: Transition.rightToLeft,
                            arguments: {
                              'patient': controller.selectedPatient.value,
                              'hour': hours[index],
                            },
                            binding: BindingsBuilder.put(
                                () => PatientInfoController()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      hours[index].toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildAlignText(
    Size size,
    String title,
    String subTitle,
  ) {
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search Patient",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFEFF2F7),
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                  ),
                  onChanged: (value) {
                    controller.searchPatient(value);
                  },
                  controller: controller.searchController,
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: GetBuilder<ArbeitzeitController>(builder: (context) {
                    return ListView.builder(
                      itemCount: controller.state?.length ?? 0,
                      itemBuilder: ((context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  controller.selectedPatient.value =
                                      controller.state?[index];
                                  Get.back();
                                },
                                child: Text(
                                    "${controller.state?[index].firstName} ${controller.state?[index].lastName}")),
                          ],
                        );
                      }),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
