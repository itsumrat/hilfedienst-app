import 'package:flutter/material.dart';

class WeeklyToureplan extends StatefulWidget {
  const WeeklyToureplan({super.key});

  @override
  State<WeeklyToureplan> createState() => _WeeklyToureplanState();
}

class _WeeklyToureplanState extends State<WeeklyToureplan> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          padding: EdgeInsets.only(left: 14, right: 14, bottom: 20, top: 20),
          decoration: BoxDecoration(
              color: Color(0xffA71D2A),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("Mo.29.8"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 125,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text("7:00 - 8:00 "),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(child: Text("2")),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Helene Fischer",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "67112 Mutterstadt Blockfeld 4",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      "Ausfall",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 16,
                      width: 2,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ]),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.only(left: 14, right: 14, bottom: 20, top: 20),
          decoration: BoxDecoration(
              color: Color(0xff008000),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("Mo.29.8"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 125,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text("7:00 - 8:00 "),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Helene Fischer",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "67112 Mutterstadt Blockfeld 4",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      "Einmalig",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffFFFF00),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 16,
                      width: 2,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ]),
        )
      ],
    );
  }
}
