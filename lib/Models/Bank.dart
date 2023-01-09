
class Bank {
  String? name;
  String? accountNum;

  Bank({this.name, this.accountNum});

  Bank.fromData(Map<String, dynamic>? documentSnapshot) {
    name = documentSnapshot != null ? documentSnapshot["name"] : null;
    accountNum =
    documentSnapshot != null ? documentSnapshot["accountNum"] : null;
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'accountNum': accountNum};
  }
}