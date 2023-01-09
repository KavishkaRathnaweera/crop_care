
import 'package:cropcare/Models/Farm.dart';

import 'Bank.dart';

class UserModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? nic;
  String? role;
  Bank? bank;
  String? farm;
  String? fcmToken;

  UserModel(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.nic,
        this.role,
        this.bank,
        this.farm,
        this.fcmToken});

  UserModel.fromDocumentSnapshot(
      {required this.id, required Map<String, dynamic> documentSnapshot}) {
    name = documentSnapshot["name"];
    phone = documentSnapshot["phone"];
    email = documentSnapshot["email"];
    nic = documentSnapshot["nic"];
    role = documentSnapshot["role"];
    bank = Bank.fromData(documentSnapshot["bank"]);
    farm = documentSnapshot["farm"];
    fcmToken = documentSnapshot["fcmToken"] ?? '';
  }
}

class UserAvatar {
  String? userId;
  String? name;
  String? address;
  String? bankName;
  String? accountNum;
  String? fcmToken;

  UserAvatar(
      {this.userId,
        this.name,
        this.address,
        this.bankName,
        this.accountNum,
        this.fcmToken});

  UserAvatar.fromData(Map<String, dynamic> data) {
    userId = data["userId"];
    name = data["name"];
    address = data["address"];
    bankName = data["bankName"];
    accountNum = data["accountNum"];
    fcmToken = data["fcmToken"];
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'address': address,
      'bankName': bankName,
      'accountNum': accountNum,
      'fcmToken': fcmToken
    };
  }
}