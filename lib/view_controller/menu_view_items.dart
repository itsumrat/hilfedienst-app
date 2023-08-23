import 'package:flutter/material.dart';
import 'package:hilfedienst/app_theme.dart';

class MenuViewItems extends StatelessWidget {
  const MenuViewItems({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    required this.color,
    this.onClick,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: size.width / 2.4,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 2),
                color: AppColors.grey)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
