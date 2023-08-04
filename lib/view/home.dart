import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_controller/title_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //get dashboard data
  Future? getDashboardFuture;
  var firstName, lastName;
  getDashBoard()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString("first_name");
      lastName = prefs.getString("last_name");
    });
    var res = await AuthController.dashBoard();
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDashboardFuture = getDashBoard();

  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: 120,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appColors.mainColor,
              ),
              child: Row(
                children: [
                  InkWell(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/icons/profile.jpeg",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, ${firstName} ${lastName}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: appColors.white),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Welcome back to Hilfedienst",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: appColors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TitleText(
                  text: "Dashboard",
                )),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: getDashboardFuture,
              builder: (context,AsyncSnapshot<dynamic> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(color: appColors.mainColor,),);
                }else if(snapshot.hasData){
                  var data = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: size.width,
                          height: 80,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFCEF5D7),
                                ),
                                child: Center(
                                  child: Icon(Icons.houseboat_outlined, size: 40,),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data["holiday_data"]}",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Total Holiday",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: size.width,
                          height: 80,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFBC2FF),
                                ),
                                child: Center(
                                  child: Icon(Icons.sick_outlined, size: 40,),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data["ill_data"]}",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Total Sick",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: size.width,
                          height: 80,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFC2E8FF),
                                ),
                                child: Center(
                                  child: Icon(Icons.health_and_safety_outlined, size: 40,),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data["current_month"]}",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Total Care Duration",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }else{
                  return Center(child: Text("Something went worng with API"),);
                }
              },
            ),
          ],
        )
      ),
    );
  }
}


