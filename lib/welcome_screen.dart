import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import the lottie package
import 'login.dart';
import 'register.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _textVisible = false;

  @override
  void initState() {
    super.initState();
    // Delay the animation to start after a short period (you can adjust the duration)
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _textVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add Lottie animation
            Lottie.asset(
              'assets/images/home.json', // Replace with the path to your Lottie animation file
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 500),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: Text(
                      'Welcome to Your App',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    bottom: _textVisible ? 20 : -50,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(width: 10), // Add space between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
