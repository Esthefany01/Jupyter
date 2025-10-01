import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback? onTapCard;
  final Widget? childWidget;

  const CustomCard({
    super.key,
    required this.onTapCard,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTapCard,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(50),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: childWidget,
        ),
      ),
    );
  }
}
