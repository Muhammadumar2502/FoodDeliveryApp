import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fooddeliveryapp/screens/home/homePage.dart';
import 'package:fooddeliveryapp/screens/home/menuScreen.dart';

class Delicious extends StatefulWidget {
  @override
  _DeliciousState createState() => _DeliciousState();
}

class _DeliciousState extends State<Delicious> {
  final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ZoomDrawer(
        mainScreenScale: 0.25,
        controller: _drawerController,
        menuScreen: MenuScreen(),
        mainScreen: HomePage(_drawerController),
        borderRadius: 24.0,
        showShadow: true,
        angle: -30,
        backgroundColor: Colors.grey.shade300,
        slideWidth: MediaQuery.of(context).size.width * .8,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}