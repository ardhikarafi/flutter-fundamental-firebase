import 'package:flutter/material.dart';
import 'package:google_auth_firebase/auth_services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Login by Guest"),
          onPressed: () async {
            await AuthServices.signInGuest();
          },
        ),
      ),
    );
  }
}
