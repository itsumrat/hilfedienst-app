import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/Arbeitszeitauswertung/Arbeitszeitauswertung.dart';
import 'package:hilfedienst/view/Patientenstamm/patientenstamm_list.dart';
import 'package:hilfedienst/view/change_password.dart';
import 'package:hilfedienst/view/login.dart';
import 'package:hilfedienst/view/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../view_controller/menu_view_items.dart';
import '../view_controller/title_text.dart';
import 'Toureplan/toureplan.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  var userData;
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userData = jsonDecode(prefs.getString("user_data")!);
      print(userData["0"]["intranet_link"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                text: "Menu",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuViewItems(
                    onClick: () {
                      Get.to(() => const Toureplan(),
                          transition: Transition.rightToLeft);
                    },
                    size: size,
                    text: 'Toureplan',
                    icon: Icons.calendar_month,
                    color: const Color(0xFFCEF5D7),
                  ),
                  MenuViewItems(
                    onClick: () => Get.to(() => const Patientenstamm(),
                        transition: Transition.rightToLeft),
                    size: size,
                    text: 'Patientenstamm',
                    icon: Icons.supervised_user_circle,
                    color: const Color(0xFFE6CEF5),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuViewItems(
                    onClick: () => Get.to(() => const Arbeitszeitauswertung(),
                        transition: Transition.rightToLeft),
                    size: size,
                    text: 'Arbeitszeitauswert-ung',
                    icon: Icons.calendar_month,
                    color: const Color(0xFFCED6F5),
                  ),
                  MenuViewItems(
                    onClick: () {
                      launchUrl(Uri.parse("${userData["0"]["intranet_link"]}"));
                    },
                    size: size,
                    text: '${userData["0"]["intranet_name"]}',
                    icon: Icons.supervised_user_circle,
                    color: const Color(0xFFF5F1CE),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Shortcuts",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                color: AppColors.black.withOpacity(0.3),
              ),
              ListTile(
                onTap: () => Get.to(() => const Profile(),
                    transition: Transition.rightToLeft),
                title: const Text(
                  "Profile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                leading: const Icon(
                  Icons.person,
                  color: AppColors.black,
                ),
              ),
              Divider(
                height: 1,
                color: AppColors.black.withOpacity(0.3),
              ),
              ListTile(
                onTap: () => Get.to(() => const ChangePassword(),
                    transition: Transition.rightToLeft),
                title: const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                leading: const Icon(
                  Icons.key,
                  color: AppColors.black,
                ),
              ),
              Divider(
                height: 1,
                color: AppColors.black.withOpacity(0.3),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => logout(),
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: const Center(
                    child: Text(
                      "Logout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  logout() {
    Get.offAll(const Login(), transition: Transition.fadeIn);
  }
}
