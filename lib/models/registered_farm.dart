import 'package:cloud_firestore/cloud_firestore.dart';

class RegisteredFarmModel {
  String? id;
  String? regNum;
  bool? registered;
  String? coordinates;

  RegisteredFarmModel({this.regNum, this.registered,this.coordinates});

  RegisteredFarmModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    regNum = documentSnapshot["regNum"];
    registered = documentSnapshot["registered"];
    coordinates = documentSnapshot["coordinates"];
  }
}
