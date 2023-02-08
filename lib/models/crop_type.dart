import 'package:cloud_firestore/cloud_firestore.dart';

class CropType {
  String? id;
  String? name;

  CropType({
    this.id,
    this.name,
  });

  CropType.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
  }
}
