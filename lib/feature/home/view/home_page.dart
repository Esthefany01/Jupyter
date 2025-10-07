import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jupyter/common/values/icons_app.dart';
import 'package:jupyter/feature/home/widget/menu_item_home.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 100),
          Center(
            child: SvgPicture.asset(
              IconsApp.carIcon,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 100),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color(0xFFC0C0C0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MenuItemHome(title: "OFICINA", onTap: () {}),
                    MenuItemHome(title: "MULTAS", onTap: () {}),
                    MenuItemHome(title: "VEÍCULO", onTap: () {}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
