import 'package:flutter/material.dart';
import 'auth_service.dart'; // Import your authentication service
import 'login.dart'; // Import the LoginScreen

class HomeScreen extends StatelessWidget {
  final AuthService authService;

  // Inject AuthService through the constructor
  HomeScreen({required this.authService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Screen!'),
            ElevatedButton(
              onPressed: () async {
                // Sign out when the button is pressed
                await authService.signOut();

                // Navigate to the LoginScreen and remove all other screens from the stack
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
