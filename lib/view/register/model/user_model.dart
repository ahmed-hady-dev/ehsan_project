class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? bloodType;
  String? address;

  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.bloodType,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'bloodType': bloodType,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      bloodType: map['bloodType'] as String,
      address: map['address'] as String,
    );
  }
}
