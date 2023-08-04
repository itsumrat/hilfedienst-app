import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/Arbeitszeitauswertung/Arbeitszeitauswertung.dart';
import 'package:hilfedienst/view/Patientenstamm/patientenstamm_list.dart';
import 'package:hilfedienst/view/Toureplan/weekly_toureplan.dart';
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
  getUser()async{
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
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                text: "Menu",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuViewItems(
                    onClick: () {
                      Get.to(Toureplan(), transition: Transition.rightToLeft);
                    },
                    size: size,
                    text: 'Toureplan',
                    icon: Icons.calendar_month,
                    color: Color(0xFFCEF5D7),
                  ),
                  MenuViewItems(
                    onClick: () => Get.to(Patientenstamm(),
                        transition: Transition.rightToLeft),
                    size: size,
                    text: 'Patientenstamm',
                    icon: Icons.supervised_user_circle,
                    color: Color(0xFFE6CEF5),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuViewItems(
                    onClick: () => Get.to(Arbeitszeitauswertung(),
                        transition: Transition.rightToLeft),
                    size: size,
                    text: 'Arbeitszeitauswert-ung',
                    icon: Icons.calendar_month,
                    color: Color(0xFFCED6F5),
                  ),
                  MenuViewItems(
                    onClick: (){
                      launchUrl(Uri.parse("${userData["0"]["intranet_link"]}"));
                    },
                    size: size,
                    text: '${userData["0"]["intranet_name"]}',
                    icon: Icons.supervised_user_circle,
                    color: Color(0xFFF5F1CE),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Shortcuts",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                color: appColors.black.withOpacity(0.3),
              ),
              ListTile(
                onTap: () =>
                    Get.to(Profile(), transition: Transition.rightToLeft),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                leading: Icon(
                  Icons.person,
                  color: appColors.black,
                ),
              ),
              Divider(
                height: 1,
                color: appColors.black.withOpacity(0.3),
              ),
              ListTile(
                onTap: () => Get.to(ChangePassword(),
                    transition: Transition.rightToLeft),
                title: Text(
                  "Change Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                leading: Icon(
                  Icons.key,
                  color: appColors.black,
                ),
              ),
              Divider(
                height: 1,
                color: appColors.black.withOpacity(0.3),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => logout(),
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: Center(
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
    Get.offAll(Login(), transition: Transition.fadeIn);
  }
}
