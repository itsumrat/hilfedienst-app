import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../view_controller/app_bar.dart';

class Signeture extends StatefulWidget {
  const Signeture({Key? key}) : super(key: key);

  @override
  State<Signeture> createState() => _SignetureState();
}

class _SignetureState extends State<Signeture> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  ///image picker
  ///also can pic file
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Appbar(
            text: "Unterschrift zum Ausfüllen",
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffEFF2F7),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Draw your signature below",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 1,
                        dashPattern: [5, 10],
                        child: SfSignaturePad(
                          key: signatureGlobalKey,
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        print("object");
                        signatureGlobalKey.currentState?.clear();
                      },
                      child: Text("Clear"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "OR",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: appColors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => uploadFile(),
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: appColors.mainColor),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attachment,
                      color: appColors.mainColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Attachments",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: appColors.mainColor,
                          fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              margin: EdgeInsets.only(left: 40, right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: ListTile(
                title: Text("Signature file name"),
                leading: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/XXXTentacion_signature.svg/1035px-XXXTentacion_signature.svg.png"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: appColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Confirm signature & Complete",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  File? image;
  Future uploadFile() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
