class TurpUser {
  static late String uid;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? fathersName;
  String? mothersName;
  String? gender;
  String? nationality;
  String? flag;

  TurpUser({
    this.firstName,
    this.lastName,
    this.birthDate,
    this.fathersName,
    this.mothersName,
    this.gender,
    this.nationality,
    this.flag,
  });

  Map<String, dynamic> toFirestore() {
    return {
      if (firstName != null) "firstName": firstName,
      if (lastName != null) "lastName": lastName,
      if (birthDate != null) "birthDate": birthDate,
      if (fathersName != null) "fathersName": fathersName,
      if (mothersName != null) "mothersName": mothersName,
      if (gender != null) "gender": gender,
      if (nationality != null) "nationality": nationality,
      if (flag != null) "flag": flag,
    };
  }

  factory TurpUser.fromFirestore(snapshot, options) {
    final data = snapshot.data();
    return TurpUser(
      firstName: data["firstName"],
      lastName: data["lastName"],
      birthDate: data["birthDate"],
      fathersName: data["fathersName"],
      mothersName: data["mothersName"],
      gender: data["gender"],
      nationality: data["nationality"],
      flag: data["flag"],
    );
  }
}
