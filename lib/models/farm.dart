class FarmModel {
  String? name;
  String? address;
  String? regNum;

  FarmModel({this.name, this.address, this.regNum});

  FarmModel.fromData(Map<String, dynamic>? documentSnapshot) {
    name = documentSnapshot != null ? documentSnapshot["name"] : null;
    address = documentSnapshot != null ? documentSnapshot["address"] : null;
    regNum = documentSnapshot != null ? documentSnapshot["regNum"] : null;
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'address': address, 'regNum': regNum};
  }
}
