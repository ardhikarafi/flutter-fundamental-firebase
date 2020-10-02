import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  static Future<void> createOrUpdateProduct(String id,
      {String name, int price}) async {
    await productCollection.doc(id).set({
      'nama': name,
      'harga': price,
    });
  }
}
