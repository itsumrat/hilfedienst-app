import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/patient_json.dart';
import 'package:hilfedienst/view_controller/title_text.dart';

import 'Patient_info.dart';

class Arbeitszeit extends StatefulWidget {
  const Arbeitszeit({Key? key}) : super(key: key);

  @override
  State<Arbeitszeit> createState() => _ArbeitszeitState();
}

class _ArbeitszeitState extends State<Arbeitszeit> {
  late String patient;
  @override
  void initState() {
    super.initState();
    patient = "Patient name";
  }

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
                    buildAlignText(size, "Today", "Thu, 29 Sep 2022"),
                    const SizedBox(
                      height: 20,
                    ),
                    buildAlignText(size, "Time", "9:00 PM"),
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
              InkWell(
                onTap: () {
                  print("object");
                  _showMyDialog();
                },
                child: Container(
                  color: const Color(0xFFEFF2F7),
                  child: ListTile(
                    title: Text(
                      patient,
                      style: const TextStyle(fontSize: 17),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width / 3.8,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(const PatinetInfo(),
                            transition: Transition.rightToLeft),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.white)),
                        child: const Text(
                          "1.5",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        )),
                  ),
                  SizedBox(
                    width: size.width / 3.8,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(const PatinetInfo(),
                            transition: Transition.rightToLeft),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.white)),
                        child: const Text(
                          "2",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        )),
                  ),
                  SizedBox(
                    width: size.width / 3.8,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(const PatinetInfo(),
                            transition: Transition.rightToLeft),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.white)),
                        child: const Text(
                          "2.5",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width / 3.8,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(const PatinetInfo(),
                            transition: Transition.rightToLeft),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.white)),
                        child: const Text(
                          "3",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        )),
                  ),
                  SizedBox(
                    width: size.width / 3.8,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(const PatinetInfo(),
                            transition: Transition.rightToLeft),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.white)),
                        child: const Text(
                          "3.5",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        )),
                  ),
                  SizedBox(
                    width: size.width / 3.8,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(const PatinetInfo(),
                            transition: Transition.rightToLeft),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.white)),
                        child: const Text(
                          "4",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        )),
                  )
                ],
              )
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
                      contentPadding: EdgeInsets.only(left: 10, right: 10)),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: PatientJson.patients.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  patient = PatientJson.patients[index];
                                });
                                Navigator.pop(context);
                              },
                              child: Text("${PatientJson.patients[index]}")),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
