import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            child: Row(children: [
              Icon(Icons.fastfood, size: 48, color: Colors.white),
              SizedBox(width: 18),
              Text('Meals', style: TextStyle(fontSize: 24)),
            ]),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.red,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
