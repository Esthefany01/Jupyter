import 'package:flutter/material.dart';
import 'package:jupyter/common/values/text_style_app.dart';

class MenuItemHome extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MenuItemHome({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.black26,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(11, 31, 77, 0.16),
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyleApp.font16.shade900,
            ),
          ),
        ),
      ),
    );
  }
}
