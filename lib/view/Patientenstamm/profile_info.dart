import 'package:flutter/material.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view_controller/app_bar.dart';

class SingleProfile extends StatefulWidget {
  const SingleProfile({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  State<SingleProfile> createState() => _SingleProfileState();
}

class _SingleProfileState extends State<SingleProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Appbar(
            text: widget.name,
            icon: Icons.close,
          )),
      body: SingleChildScrollView(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildAlignText(size, "FirstName", "Mail"),
                  buildAlignText(size, "LastName", "Mail"),
                  buildAlignText(size, "Nachname", "Mail"),
                  buildAlignText(size, "Straße & Nr*", "Mail"),
                  buildAlignText(size, "Plz/Ort*", "Mail"),
                  buildAlignText(size, "Geburtsdatum*", "Mail"),
                  buildAlignText(size, "Telefonnummer (Festnetz)", "Mail"),
                  buildAlignText(size, "Handy", "Mail"),
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
                      size, "Sozialversicherungsnummer", "321321321"),
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
                  buildAlignText(size, "Familienstand", "Ledi"),
                  buildAlignText(size, "Geburtsort", "dfasdfa"),
                  buildAlignText(size, "Staatsangehörigkeit", "3242342"),
                  buildAlignText(size, "Schwerbehindert*",
                      "Nein, ich bin NICHT Schwerbehindert"),
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
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildAlignText(
                      size, "Steuer-Identifikationsnummer", "12345678911"),
                  buildAlignText(
                      size, "Üben Sie weitere Beschäftigungen aus?*", "N/A"),
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
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildAlignText(
                      size, "Steuer-Identifikationsnummer", "12345678911"),
                  const Text(
                      "(Seit 2008 besitzt jeder deutsche Bürger eine Steuer-Identifikationsnummer. Diese 11-stellige Nummer haben Sie mit einem Brief vom Bundeszentralamt für Steuern erhalten. Die Nummer steht oben rechts groß auf dem Brief. Alternativ finden Sie die Steuer-ID auch auf Ihrer Lohnsteuerbescheinigung.)"),
                  const SizedBox(
                    height: 15,
                  ),
                  buildAlignText(size, "Steuerklasse*", "N/A"),
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
                      "ja"),
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
                  buildAlignText(size, "Kinderfreibeträge*", "subTitle"),
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
                  buildAlignText(size, "Kinderfreibeträge*", "subTitle"),
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
                  buildAlignText(size, "Bank IBAN*", "4324 45245 432534"),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
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
