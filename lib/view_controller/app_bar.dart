import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilfedienst/app_theme.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key, required this.text, this.icon = Icons.arrow_back})
      : super(key: key);
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            icon,
            color: AppColors.black,
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
