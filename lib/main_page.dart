import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_firebase/auth_services.dart';

class MainPage extends StatelessWidget {
  final User user;

  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Data Guest ID : " + user.uid),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () async {
                await AuthServices.signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
