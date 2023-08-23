import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/controller/auth_controller.dart';

import '../view_controller/app_bar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserFuture = getUser();
  }

  var userData;
  Future? getUserFuture;
  getUser() async {
    var res = await AuthController.profileController();
    print("sataus code ${res.statusCode}");
    if (res.statusCode == 200) {
      return jsonDecode(res.body)[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Appbar(
              text: "Profile",
            )),
        body: FutureBuilder(
          future: getUserFuture,
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ),
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data;
              return SingleChildScrollView(
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
                          buildAlignText(size, "Geschlecht", "Null"),
                          buildAlignText(
                              size, "Vorname", "${data["first_name"]}"),
                          buildAlignText(
                              size, "Nachname", "${data["last_name"]}"),
                          buildAlignText(size, "Straße & Nr*", "null"),
                          buildAlignText(size, "Plz/Ort*", "null"),
                          buildAlignText(size, "Geburtsdatum*", "null"),
                          buildAlignText(size, "Telefonnummer (Festnetz)",
                              "${data["p_token"]}"),
                          buildAlignText(size, "Handy", "Null"),
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
                          buildAlignText(
                              size, "Sozialversicherungsnummer", "Null"),
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
                          buildAlignText(size, "Familienstand", "Null"),
                          buildAlignText(size, "Geburtsort", "Null"),
                          buildAlignText(size, "Staatsangehörigkeit", "Null"),
                          buildAlignText(size, "Schwerbehindert*", "Null"),
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
                          buildAlignText(
                              size, "Steuer-Identifikationsnummer", "null"),
                          buildAlignText(size,
                              "Üben Sie weitere Beschäftigungen aus?*", "Null"),
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
                          buildAlignText(
                              size, "Steuer-Identifikationsnummer", "Null"),
                          const Text(
                              "(Seit 2008 besitzt jeder deutsche Bürger eine Steuer-Identifikationsnummer. Diese 11-stellige Nummer haben Sie mit einem Brief vom Bundeszentralamt für Steuern erhalten. Die Nummer steht oben rechts groß auf dem Brief. Alternativ finden Sie die Steuer-ID auch auf Ihrer Lohnsteuerbescheinigung.)"),
                          const SizedBox(
                            height: 15,
                          ),
                          buildAlignText(size, "Steuerklasse*", "Null"),
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
                              "Null"),
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
                          buildAlignText(size, "Kinderfreibeträge*", "Null"),
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
                          buildAlignText(size, "Kinderfreibeträge*", "Null"),
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
                          buildAlignText(size, "Bank IBAN*", "null"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("Something went worng with API"),
              );
            }
          },
        ));
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
