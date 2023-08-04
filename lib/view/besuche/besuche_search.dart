import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';

class BesucheSearch extends StatefulWidget {
  const BesucheSearch({super.key});

  @override
  State<BesucheSearch> createState() => _BesucheSearchState();
}

class _BesucheSearchState extends State<BesucheSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: appColors.black,
          ),
        ),
        title: TextFormField(
          autofocus: true,
          decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
