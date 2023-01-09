import 'package:cloud_firestore/cloud_firestore.dart';

class RegisteredFarmModel {
  String? id;
  String? regNum;
  bool? registered;

  RegisteredFarmModel({this.regNum, this.registered});

  RegisteredFarmModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    regNum = documentSnapshot["regNum"];
    registered = documentSnapshot["registered"];
  }
}
