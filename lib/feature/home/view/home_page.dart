import 'package:flutter/material.dart';
import 'package:jupyter/common/values/text_style_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyleApp.font14.shade600,
        ),
      ),
    );
  }
}
