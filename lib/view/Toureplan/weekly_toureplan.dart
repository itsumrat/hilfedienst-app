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
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20, top: 20),
          decoration: BoxDecoration(
              color: const Color(0xffA71D2A),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: const [
                          Icon(Icons.calendar_month),
                          Text("Mo.29.8"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 125,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: const [
                          Icon(Icons.watch_later_outlined),
                          Text("7:00 - 8:00 "),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Center(child: Text("2")),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Helene Fischer",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "67112 Mutterstadt Blockfeld 4",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Text(
                      "Ausfall",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 16,
                      width: 2,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
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
        const SizedBox(
          height: 20,
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20, top: 20),
          decoration: BoxDecoration(
              color: const Color(0xff008000),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: const [
                          Icon(Icons.calendar_month),
                          Text("Mo.29.8"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 125,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: const [
                          Icon(Icons.watch_later_outlined),
                          Text("7:00 - 8:00 "),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Helene Fischer",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "67112 Mutterstadt Blockfeld 4",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Text(
                      "Einmalig",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffFFFF00),
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 16,
                      width: 2,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
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
