import 'package:cloud_firestore/cloud_firestore.dart';
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
                ),
                RaisedButton(
                  child: Text("Get Data"),
                  onPressed: () async {
                    DocumentSnapshot snapshot =
                        await DatabaseServices.getProduct("1");
                    print(snapshot.data()['nama']);
                    print(snapshot.data()['harga']);
                  },
                ),
                RaisedButton(
                  child: Text("Delete Data"),
                  onPressed: () async {
                    await DatabaseServices.deleteProduct("1");
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
