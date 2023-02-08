class BankModel {
  String? name;
  String? accountNum;

  BankModel({this.name, this.accountNum});

  BankModel.fromData(Map<String, dynamic>? documentSnapshot) {
    name = documentSnapshot != null ? documentSnapshot["name"] : null;
    accountNum =
        documentSnapshot != null ? documentSnapshot["accountNum"] : null;
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'accountNum': accountNum};
  }
}
