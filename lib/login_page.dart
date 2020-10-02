import 'package:flutter/material.dart';
import 'package:google_auth_firebase/auth_services.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: emailController,
              ),
            ),
            Container(
              width: 300,
              height: 100,
              child: TextField(controller: passController),
            ),
            RaisedButton(
              child: Text("Login by Guest"),
              onPressed: () async {
                await AuthServices.signInGuest();
              },
            ),
            RaisedButton(
              child: Text("Sign In"),
              onPressed: () async {
                await AuthServices.signIn(
                    emailController.text, passController.text);
              },
            ),
            RaisedButton(
              child: Text("Sign Up"),
              onPressed: () async {
                await AuthServices.signUp(
                    emailController.text, passController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
