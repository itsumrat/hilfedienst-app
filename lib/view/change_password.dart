import 'package:flutter/material.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view_controller/app_bar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Appbar(
            text: "Change Password",
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("New Password",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffEFF2F7),
                      hintText: "......",
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Confirm Password",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffEFF2F7),
                      hintText: "......",
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor),
                  child: const Center(
                      child: Text(
                    "Save",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
              ]),
        ),
      ),
    );
  }
}
