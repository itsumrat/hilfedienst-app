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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Appbar(
            text: "Change Password",
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Form(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("New Password",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF2F7),
                      hintText: "......",
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Confirm Password",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF2F7),
                      hintText: "......",
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appColors.mainColor),
                  child: Center(
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
