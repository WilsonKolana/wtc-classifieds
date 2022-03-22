import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:client/views/login.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: const Text("Welcome to WeThinkCode_Classifieds",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF244581))),
            backgroundColor: Colors.white,
            nextScreen: const Login())),
  );
}
