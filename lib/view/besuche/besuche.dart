import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';
import 'package:hilfedienst/view_controller/title_text.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

import 'besuche_search.dart';

class Besuche extends StatefulWidget {
  const Besuche({Key? key}) : super(key: key);

  @override
  State<Besuche> createState() => _BesucheState();
}

class _BesucheState extends State<Besuche> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(text: "Besuche"),
              SizedBox(
                height: 20,
              ),
              isSearch
                  ? Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: ()=>setState(() {
                            isSearch = false;
                          }),
                          icon: Icon(Icons.close),
                        )
                      ),
                    ),
                 ) : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => showMonth(),
                    child: Container(
                      width: size.width / 2.1,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              "September 2022",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ShwoFillter();
                    },
                    child: Container(
                      width: size.width / 4,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_list_outlined,
                              size: 20,
                            ),
                            Text(
                              "Filter",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      isSearch = true;
                    }),
                    child: Container(
                      width: size.width / 8,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (_, index) {
                    return besucheItems(size);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool istrue = false;
  void ShwoFillter() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Booking type",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: appColors.mainColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(40)),
                          child: Text("Patient care"),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xffEFF2F7),
                              borderRadius: BorderRadius.circular(40)),
                          child: Text("Office work"),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xffEFF2F7),
                              borderRadius: BorderRadius.circular(40)),
                          child: Text("Urlaub"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xffEFF2F7),
                              borderRadius: BorderRadius.circular(40)),
                          child: Text("Festival"),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xffEFF2F7),
                              borderRadius: BorderRadius.circular(40)),
                          child: Text("Urlaub"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  ///Show month picker popup
  ///date save variable
  var selectedDate;

  ///month save here
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

  Container besucheItems(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      margin: EdgeInsets.only(bottom: 20),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: size.width / 2.8,
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFFF5EBF0),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2022-09-05",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: size.width / 2.8,
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFFF5EBF0),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2022-09-05",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            style: TextStyle(color: appColors.black),
            children: [
              TextSpan(
                  text: "Besuch: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  )),
              TextSpan(
                  text: "Büro Arbeitszeit",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                  ))
            ],
          ))
        ],
      ),
    );
  }
}

class BookingType {
  final String text;
  BookingType({required this.text});
}

List<BookingType> list = [
  BookingType(
    text: "Patient care",
  ),
  BookingType(
    text: "Office Work",
  ),
  BookingType(
    text: "Festival",
  ),
  BookingType(
    text: "Festival",
  ),
  BookingType(
    text: "Fahrtzeit",
  ),
];
