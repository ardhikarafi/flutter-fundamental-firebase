import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_firebase/auth_services.dart';
import 'package:google_auth_firebase/database_services.dart';
import 'package:google_auth_firebase/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   value: AuthServices.firebaseUserStream,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Wrapper(),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Fire Store Demo")),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Add Data"),
                  onPressed: () {
                    DatabaseServices.createOrUpdateProduct("1",
                        name: "Masker", price: 50000);
                  },
                ),
                RaisedButton(
                  child: Text("Edit Data"),
                  onPressed: () {
                    DatabaseServices.createOrUpdateProduct("1",
                        name: "Hand Stabilizer", price: 250000);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
