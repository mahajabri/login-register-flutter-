import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'auth_service.dart';
import 'register.dart';
import 'home_screen.dart';
import 'forget_passsword.dart';
import 'welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      extendBodyBehindAppBar: true, // Set to true to extend the body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set the background color to transparent
        elevation: 0, // Remove app bar shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset(
                      'assets/images/coffeee.json',
                      width: 110,
                      height: 100,
                    ),
                    SizedBox(width: 2),
                    Text(
                      'Sign In.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          filled: true,
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 47, 25, 5),
                    ),
                    child: Text('Forgot Password'),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text;

                    User? user = await authService.signInWithEmailAndPassword(email, password);

                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen(authService: authService)),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Login Failed'),
                          content: Text('Invalid email or password. Please try again.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 60),
                  ),
                  child: Text('Login', style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        primary: const Color.fromARGB(255, 74, 67, 7),
                      ),
                      child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
