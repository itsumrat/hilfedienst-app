import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/profile_controller.dart';

import '../view_controller/app_bar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Appbar(
            text: "Profile",
          )),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return controller.obx(
            (state) => SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 30),
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
                        buildAlignText(
                            size, "Geschlecht", state?.profile?.gender ?? ""),
                        buildAlignText(size, "Vorname", state?.firstName ?? ""),
                        buildAlignText(size, "Nachname", state?.lastName ?? ""),
                        buildAlignText(size, "Straße & Nr*",
                            state?.profile?.streetNo ?? ""),
                        buildAlignText(
                            size, "Plz/Ort*", state?.profile?.dob ?? ""),
                        buildAlignText(size, "Geburtsdatum*", ""),
                        buildAlignText(size, "Telefonnummer (Festnetz)",
                            state?.profile?.mobile ?? ""),
                        buildAlignText(size, "Handy", ""),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 30),
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
                        buildAlignText(size, "Sozialversicherungsnummer",
                            state?.profile?.socialSecurityNumber ?? ""),
                        const Text(
                          "(Bis 2010 war es so, dass du einen Sozialversicherungsausweis erhalten hast auf dem die Sozialversicherungsnummer steht. Ab Januar 2011 ist es aber so, dass dir die Deutsche Rentenversicherung bei Aufnahme deiner ersten Beschäftigung einen einfachen Brief schickt, in dem deine Sozialversicherungsnummer steht.)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildAlignText(size, "Familienstand",
                            state?.profile?.maritalStatus.toString() ?? ""),
                        buildAlignText(size, "Geburtsort",
                            state?.profile?.placeOfBirth ?? ""),
                        buildAlignText(size, "Staatsangehörigkeit",
                            state?.profile?.nationality ?? ""),
                        buildAlignText(size, "Schwerbehindert*",
                            state?.profile?.severelyDisabled.toString() ?? ""),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 30),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Beschäftigung",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 19),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildAlignText(size, "Steuer-Identifikationsnummer",
                            state?.profile?.identificationNo ?? ""),
                        buildAlignText(
                            size,
                            "Üben Sie weitere Beschäftigungen aus?*",
                            state?.profile?.moreOccupation.toString() ?? ""),
                      ],
                    ),
                  ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Steuer",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 19),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildAlignText(size, "Steuer-Identifikationsnummer",
                            state?.profile?.identificationNo ?? ""),
                        const Text(
                            "(Seit 2008 besitzt jeder deutsche Bürger eine Steuer-Identifikationsnummer. Diese 11-stellige Nummer haben Sie mit einem Brief vom Bundeszentralamt für Steuern erhalten. Die Nummer steht oben rechts groß auf dem Brief. Alternativ finden Sie die Steuer-ID auch auf Ihrer Lohnsteuerbescheinigung.)"),
                        const SizedBox(
                          height: 15,
                        ),
                        buildAlignText(size, "Steuerklasse*",
                            state?.profile?.taxClass.toString() ?? ""),
                      ],
                    ),
                  ),
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
                        buildAlignText(
                            size,
                            "Haben Sie Kinder?* Auch Erwachsene sowie eventuell verstorbene Kinde (Totgeburten)*",
                            state?.profile?.children.toString() ?? ""),
                      ],
                    ),
                  ),
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
                        buildAlignText(size, "Kinderfreibeträge*",
                            state?.profile?.childAllowance.toString() ?? ""),
                      ],
                    ),
                  ),
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
                        buildAlignText(size, "Kinderfreibeträge*",
                            state?.profile?.childAllowance.toString() ?? ""),
                      ],
                    ),
                  ),
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
                        buildAlignText(
                            size, "Bank IBAN*", state?.profile?.bank ?? ""),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            onEmpty: const Center(
              child: Text("No data found"),
            ),
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            onError: (error) => Center(
              child: Text(error ?? "Error"),
            ),
          );
        },
      ),
    );
  }

  Padding buildAlignText(
    Size size,
    String title,
    String subTitle,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
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
