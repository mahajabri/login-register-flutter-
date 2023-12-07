 import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_projectt/pallete.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'login.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        title: 'Flutter Project',
        theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
        initialRoute: '/login', // Set the initial route to '/login'
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(authService: Provider.of<AuthService>(context)),
        },
      ),
    ),
  );
}