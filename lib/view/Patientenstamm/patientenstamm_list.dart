import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view/Patientenstamm/profile_info.dart';

import '../../json.dart';
import '../../view_controller/app_bar.dart';

class Patientenstamm extends StatefulWidget {
  const Patientenstamm({Key? key}) : super(key: key);

  @override
  State<Patientenstamm> createState() => _PatientenstammState();
}

class _PatientenstammState extends State<Patientenstamm> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Appbar(
            text: "Patientenstamm",
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: size.width / 1.4,
                    decoration: const BoxDecoration(color: Color(0xffEFF2F7)),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          hintText: "Search here",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                          )),
                    )),
                InkWell(
                  onTap: () => ShwoFillter(),
                  child: Container(
                    width: 50,
                    height: 49,
                    decoration: const BoxDecoration(color: Color(0xffEFF2F7)),
                    child: const Center(
                      child: Icon(Icons.filter_list_outlined),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "21 Result",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Colors.grey.shade400),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Jsons.json.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: ListTile(
                      onTap: () => Get.to(
                          () => SingleProfile(
                              name: "${Jsons.json[index]["name"]}"),
                          transition: Transition.downToUp),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${Jsons.json[index]["name"]}",
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Klient-Nr: ${Jsons.json[index]["client_no"]}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Last care date: ${Jsons.json[index]["date"]}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            "$index",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      trailing: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.shade300,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void ShwoFillter() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Short By",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Default'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.list_alt),
                title: const Text('A to Z'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.list_alt),
                title: const Text('Z to A'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
