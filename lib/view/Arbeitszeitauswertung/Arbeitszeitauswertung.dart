import 'package:flutter/material.dart';
import 'package:hilfedienst/view_controller/app_bar.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

class Arbeitszeitauswertung extends StatefulWidget {
  const Arbeitszeitauswertung({super.key});

  @override
  State<Arbeitszeitauswertung> createState() => _ArbeitszeitauswertungState();
}

class _ArbeitszeitauswertungState extends State<Arbeitszeitauswertung> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Appbar(
            text: "Arbeitszeitauswertung",
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => showMonth(),
                child: Container(
                  width: size.width / 1.9,
                  height: 40,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(color: Color(0xffEFF2F7)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "September 2022",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black54,
                      )
                    ],
                  )),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Show current"),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    spreadRadius: 2)
              ],
            ),
            child: Column(children: [
              buildAlignText(size, "Stunden diesen Monat:", "00:00"),
              buildAlignText(size, "Urlaubstage erhalten:", "2"),
              buildAlignText(size, "Krankheitstage:", "0"),
              buildAlignText(size, "Urlaubstage für 2021:", "20"),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 2),
                              color: Colors.grey.shade200,
                              blurRadius: 10,
                              spreadRadius: 2)
                        ],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Woche 35",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xffEBEDF0),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        "Soll",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        "lst",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        "  Diff",
                                      ),
                                    )
                                  ]),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xffF5F7FA),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        "${index * 2}",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        "${index * 2 + 7}",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.arrow_downward_outlined,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            "0",
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            )
                          ]),
                    );
                  }))
        ]),
      ),
    );
  }

  Padding buildAlignText(
    Size size,
    String title,
    String subTitle,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width / 2,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
          SizedBox(
            width: size.width / 3,
            child: Text(
              subTitle,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  ///month save here
  var selectedDate;
  void showMonth() {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDate = date;
        });
      }
    });
  }
}
