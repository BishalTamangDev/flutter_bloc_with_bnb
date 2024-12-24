import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) => Drawer(
        width: MediaQuery.of(context).size.width / 1.25,
        child: Center(
          child: Text("This is drawer"),
        ),
      );
}
