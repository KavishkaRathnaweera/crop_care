import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropcare/models/incident.dart';
import 'package:cropcare/models/incident_status.dart';
import 'package:cropcare/models/registered_farm.dart';
import 'package:flutter/foundation.dart';

import '../models/user.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("Users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "phone": user.phone,
        "nic": user.nic,
        "role": user.role,
        "profilePicRef": user.profilePicRef,
        "bank": user.bank,
        "farm": user.farm,
        "fcmToken": user.fcmToken
      });
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<UserModel> getUser(String? uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("Users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(
          id: _doc.id, documentSnapshot: _doc.data() as Map<String, dynamic>);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<List<IncidentModel>> getIncidents() async {
    try {
      QuerySnapshot _doc = await _firestore.collection("incidents").get();

      return _doc.docs
          .map((doc) => IncidentModel.fromDocumentSnapshot(
              id: doc.id, documentSnapshot: doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<void> setIncidentStatus(
      String id, IncidentStatus status, String comment, num amount) async {
    try {
      await _firestore.collection("incidents").doc(id).update({
        "status": status.name,
        "reviewDate": status.name == "IN-PROGRESS"
            ? Timestamp.fromDate(DateTime.now())
            : null,
        "completeDate": status.name == "COMPLETED"
            ? Timestamp.fromDate(DateTime.now())
            : null,
        "rejectDate": status.name == "REJECTED"
            ? Timestamp.fromDate(DateTime.now())
            : null,
        "comment": comment.trim(),
        "amount": amount
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Stream<List<IncidentModel>> incidentStream() {
    return _firestore
        .collection("incidents")
        .orderBy("date", descending: true)
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => IncidentModel.fromDocumentSnapshot(
                id: doc.id,
                documentSnapshot: doc.data() as Map<String, dynamic>))
            .toList());
  }

  Stream<List<IncidentModel>> userNewIncidents(String userId) {
    return _firestore
        .collection("incidents")
        .where('user.userId', isEqualTo: userId)
        .where('status', whereIn: ["NEW", "IN_PROGRESS"])
        .orderBy("date", descending: true)
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => IncidentModel.fromDocumentSnapshot(
                id: doc.id,
                documentSnapshot: doc.data() as Map<String, dynamic>))
            .toList());
  }

  Stream<List<IncidentModel>> userCompleteIncidents(String userId) {
    return _firestore
        .collection("incidents")
        .where('user.userId', isEqualTo: userId)
        .where('status', whereIn: ["COMPLETED", "REJECTED"])
        .orderBy("date", descending: true)
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => IncidentModel.fromDocumentSnapshot(
                id: doc.id,
                documentSnapshot: doc.data() as Map<String, dynamic>))
            .toList());
  }

  Future<bool> registerUser(UserModel user, String regFarmId) async {
    try {
      // update farm to registered
      await _firestore
          .collection("registered farms")
          .doc(regFarmId)
          .update({"registered": true});

      // update user
      await _firestore.collection("Users").doc(user.id).update({
        "name": user.name,
        "phone": user.phone,
        "email": user.email,
        "nic": user.nic,
        "role": user.role,
        "profilePicRef": user.profilePicRef,
        "fcmToken": user.fcmToken,
        "bank": user.bank!.toMap(),
        "farm": user.farm!.toMap()
      });

      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<List<RegisteredFarmModel>> isFarmRegistered(String regNum) async {
    try {
      QuerySnapshot _doc = await _firestore
          .collection("registered farms")
          .where('regNum', isEqualTo: regNum)
          .limit(1)
          .get();

      return _doc.docs
          .map((DocumentSnapshot doc) =>
              RegisteredFarmModel.fromDocumentSnapshot(doc))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<bool> updateOfficer(UserModel user) async {
    try {
      await _firestore.collection("Users").doc(user.id).update({
        "name": user.name,
        "phone": user.phone,
        "nic": user.nic,
        "profilePicRef": user.profilePicRef
      });
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<List<String>> getCropTypes() async {
    try {
      List<String> cropTypeNames = [];

      QuerySnapshot _query = await _firestore.collection("crops").get();
      for (var _doc in _query.docs) {
        cropTypeNames.add(_doc["name"]);
      }
      return cropTypeNames;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<bool> createIncident(IncidentModel incident) async {
    List media = incident.media!.map((e) => e.toMap()).toList();
    try {
      await _firestore.collection("incidents").add({
        "types": incident.types,
        "description": incident.description,
        "media": media,
        "acres": incident.acres,
        "date": incident.date,
        "status": incident.status!.name,
        "user": incident.user!.toMap(),
        "reviewDate": incident.reviewDate,
        "rejectDate": incident.rejectDate,
        "completeDate": incident.completeDate,
        "comment": incident.comment,
        "amount": incident.amount
      });
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
