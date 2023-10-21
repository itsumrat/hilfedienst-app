import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/view/Arbeitszeit/controller/patient_info_controller.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Signeture extends StatefulWidget {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey;
  const Signeture({Key? key, required this.signatureGlobalKey})
      : super(key: key);

  @override
  State<Signeture> createState() => _SignetureState();
}

class _SignetureState extends State<Signeture> {
  final controller = Get.find<PatientInfoController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
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
                  child: SfSignaturePad(
                    key: widget.signatureGlobalKey,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      widget.signatureGlobalKey.currentState?.clear();
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
      ],
    );
  }
}
