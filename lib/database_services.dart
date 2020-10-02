import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
//INFO TEMPAT COLLECTION
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

//CREATE OR UPDATE DB
  static Future<void> createOrUpdateProduct(String id,
      {String name, int price}) async {
    await productCollection.doc(id).set({
      'nama': name,
      'harga': price,
    });
  }

//READ DATA
  static Future<DocumentSnapshot> getProduct(String id) async {
    return await productCollection.doc(id).get();
  }

//DELETE DATA
  static Future<void> deleteProduct(String id) async {
    await productCollection.doc(id).delete();
  }
}
