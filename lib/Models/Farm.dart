
class Farm {
  String? name;
  String? address;
  String? regNum;
  double? longitude;
  double? latitude;
  double? landSize;

  Farm({this.name, this.address, this.regNum});

  //TODO : Check location details
  Farm.fromData(Map<String, dynamic>? documentSnapshot) {
    name = documentSnapshot != null ? documentSnapshot["name"] : null;
    address = documentSnapshot != null ? documentSnapshot["address"] : null;
    regNum = documentSnapshot != null ? documentSnapshot["registered_id"] : null;
    latitude = documentSnapshot != null ? documentSnapshot["location"].longitude : null;
    longitude = documentSnapshot != null ? documentSnapshot["location"].longitude : null;
    landSize = documentSnapshot != null ? documentSnapshot["land_size_hect"] : null;

  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'address': address, 'regNum': regNum, 'latitude':latitude, 'longitude':longitude, 'landSize':landSize};
  }
}