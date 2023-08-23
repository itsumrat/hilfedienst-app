import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_config.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/index.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final _login = GlobalKey<FormState>();

  late bool _passwordVisible;

  bool isLoading = false;
  login() async {
    setState(() => isLoading = true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await http.post(Uri.parse(AppConfig.LOGIN),
        body: {"user_name": email.text, "password": pass.text});

    // print("object ${res.body}");
    print("object ${res.statusCode}");
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data["0"]);
      prefs.setString("token", data["token"]);
      prefs.setString("user_id", data["0"]["id"].toString());
      prefs.setString("first_name", data["0"]["first_name"].toString());
      prefs.setString("last_name", data["0"]["last_name"].toString());

      Get.to(
          () => const Index(
                index: 0,
              ),
          transition: Transition.rightToLeft);
    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height / 7,
              ),
              Image.asset(
                "assets/icons/falshicon.png",
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: size.width,
                height: size.height / 1.5,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mitarbeiter Login",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 18.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _login,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey,
                                contentPadding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Username",
                                prefixIcon: Container(
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 10, top: 5, bottom: 5),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: const Icon(
                                    Icons.person,
                                    color: AppColors.textColor,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: pass,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor: AppColors.grey,
                                contentPadding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Password",
                                prefixIcon: Container(
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 10, top: 5, bottom: 5),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: const Icon(
                                    Icons.key,
                                    color: AppColors.textColor,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              login();
                            },
                            child: Container(
                              width: size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
