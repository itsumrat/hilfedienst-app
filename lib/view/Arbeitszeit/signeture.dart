import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/utils/signature_key_to_file.dart';
import 'package:hilfedienst/view/Arbeitszeit/controller/patient_info_controller.dart';
import 'package:hilfedienst/view/index.dart';
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
  final controller = Get.find<PatientInfoController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Appbar(
            text: "Unterschrift zum Ausfüllen",
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xffEFF2F7),
              ),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Draw your signature below",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 200,
                    child: DottedBorder(
                      color: Colors.grey,
                      strokeWidth: 1,
                      dashPattern: const [5, 10],
                      child: image == null
                          ? SfSignaturePad(
                              key: signatureGlobalKey,
                            )
                          : Image.file(image!),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          image = null;
                          signatureGlobalKey.currentState?.clear();
                        });
                      },
                      child: const Text("Clear"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                "OR",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => uploadFile(),
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.attachment,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Attachments",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainColor,
                          fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: const EdgeInsets.only(left: 40, right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: ListTile(
                title: const Text("Signature file name"),
                leading: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/XXXTentacion_signature.svg/1035px-XXXTentacion_signature.svg.png"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          if (signatureGlobalKey.currentState!.toPathList().isEmpty &&
              image == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please draw your signature"),
              ),
            );
          } else {
            File signature = await signatureKeyToFile(signatureGlobalKey);
            var result =
                await controller.sendBookingRequest(image: image ?? signature);
            if (result) {
              Get.snackbar("Success!", "Booking request sent successfully",
                  backgroundColor: Colors.green, colorText: Colors.white);
              Get.offAll(
                () => const Index(
                  index: 0,
                ),
                transition: Transition.zoom,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sorry! Something went wrong."),
                ),
              );
            }
          }
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              "Confirm signature & Complete",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
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
      log("Failed to pick image: $e");
    }
  }
}
