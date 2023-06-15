// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? profileName;
  final String? dob;
  final String? bio;
  final String? firstLogin;
  final String? userName;
  final List? profileImages;
  final List? coverImages;
  final String? profileImgMain;
  final String? coverImgMain;
  final String? phoneNumber;
  final String? email;
  final bool? isdeleted;
  final bool? profileupdated;
  final String? customerId;
  final String? facebookVerified;
  final String? googleVerified;
  final String? twitterVerified;
  final String? myreferalCode;
  final String? myreferalString;
  UserModel({
    this.profileName,
    this.dob,
    this.bio,
    this.firstLogin,
    this.userName,
    this.profileImages,
    this.coverImages,
    this.profileImgMain,
    this.coverImgMain,
    this.phoneNumber,
    this.email,
    this.isdeleted,
    this.profileupdated,
    this.customerId,
    this.facebookVerified,
    this.googleVerified,
    this.twitterVerified,
    this.myreferalCode,
    this.myreferalString,
  });

  UserModel copyWith({
    String? profileName,
    String? dob,
    String? bio,
    String? firstLogin,
    String? userName,
    List? profileImages,
    List? coverImages,
    String? profileImgMain,
    String? coverImgMain,
    String? phoneNumber,
    String? email,
    bool? isdeleted,
    bool? profileupdated,
    String? customerId,
    String? facebookVerified,
    String? googleVerified,
    String? twitterVerified,
    String? myreferalCode,
    String? myreferalString,
  }) {
    return UserModel(
      profileName: profileName ?? this.profileName,
      dob: dob ?? this.dob,
      bio: bio ?? this.bio,
      firstLogin: firstLogin ?? this.firstLogin,
      userName: userName ?? this.userName,
      profileImages: profileImages ?? this.profileImages,
      coverImages: coverImages ?? this.coverImages,
      profileImgMain: profileImgMain ?? this.profileImgMain,
      coverImgMain: coverImgMain ?? this.coverImgMain,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      isdeleted: isdeleted ?? this.isdeleted,
      profileupdated: profileupdated ?? this.profileupdated,
      customerId: customerId ?? this.customerId,
      facebookVerified: facebookVerified ?? this.facebookVerified,
      googleVerified: googleVerified ?? this.googleVerified,
      twitterVerified: twitterVerified ?? this.twitterVerified,
      myreferalCode: myreferalCode ?? this.myreferalCode,
      myreferalString: myreferalString ?? this.myreferalString,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'profileName': profileName,
      'dob': dob,
      'bio': bio,
      'firstLogin': firstLogin,
      'userName': userName,
      'profileImages': profileImages?.toList(),
      'coverImages': coverImages?.toList(),
      'profileImgMain': profileImgMain,
      'coverImgMain': coverImgMain,
      'phoneNumber': phoneNumber,
      'email': email,
      'isdeleted': isdeleted,
      'profileupdated': profileupdated,
      'customerId': customerId,
      'facebookVerified': facebookVerified,
      'googleVerified': googleVerified,
      'twitterVerified': twitterVerified,
      'myreferalCode': myreferalCode,
      'myreferalString': myreferalString,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      profileName:
          map['profileName'] != null ? map['profileName'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      firstLogin:
          map['firstLogin'] != null ? map['firstLogin'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      profileImages: map['profileImages'] != null
          ? List.from(map['profileImages'] as List)
          : null,
      coverImages: map['coverImages'] != null
          ? List.from(map['coverImages'] as List)
          : null,
      profileImgMain: map['profileImgMain'] != null
          ? map['profileImgMain'] as String
          : null,
      coverImgMain:
          map['coverImgMain'] != null ? map['coverImgMain'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      isdeleted: map['isdeleted'] != null ? map['isdeleted'] as bool : null,
      profileupdated:
          map['profileupdated'] != null ? map['profileupdated'] as bool : null,
      customerId:
          map['customerId'] != null ? map['customerId'] as String : null,
      facebookVerified: map['facebookVerified'] != null
          ? map['facebookVerified'] as String
          : null,
      googleVerified: map['googleVerified'] != null
          ? map['googleVerified'] as String
          : null,
      twitterVerified: map['twitterVerified'] != null
          ? map['twitterVerified'] as String
          : null,
      myreferalCode:
          map['myreferalCode'] != null ? map['myreferalCode'] as String : null,
      myreferalString: map['myreferalString'] != null
          ? map['myreferalString'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(profileName: $profileName, dob: $dob, bio: $bio, firstLogin: $firstLogin, userName: $userName, profileImages: $profileImages, coverImages: $coverImages, profileImgMain: $profileImgMain, coverImgMain: $coverImgMain, phoneNumber: $phoneNumber, email: $email, isdeleted: $isdeleted, profileupdated: $profileupdated, customerId: $customerId, facebookVerified: $facebookVerified, googleVerified: $googleVerified, twitterVerified: $twitterVerified, myreferalCode: $myreferalCode, myreferalString: $myreferalString)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.profileName == profileName &&
        other.dob == dob &&
        other.bio == bio &&
        other.firstLogin == firstLogin &&
        other.userName == userName &&
        other.profileImages == profileImages &&
        other.coverImages == coverImages &&
        other.profileImgMain == profileImgMain &&
        other.coverImgMain == coverImgMain &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.isdeleted == isdeleted &&
        other.profileupdated == profileupdated &&
        other.customerId == customerId &&
        other.facebookVerified == facebookVerified &&
        other.googleVerified == googleVerified &&
        other.twitterVerified == twitterVerified &&
        other.myreferalCode == myreferalCode &&
        other.myreferalString == myreferalString;
  }

  @override
  int get hashCode {
    return profileName.hashCode ^
        dob.hashCode ^
        bio.hashCode ^
        firstLogin.hashCode ^
        userName.hashCode ^
        profileImages.hashCode ^
        coverImages.hashCode ^
        profileImgMain.hashCode ^
        coverImgMain.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        isdeleted.hashCode ^
        profileupdated.hashCode ^
        customerId.hashCode ^
        facebookVerified.hashCode ^
        googleVerified.hashCode ^
        twitterVerified.hashCode ^
        myreferalCode.hashCode ^
        myreferalString.hashCode;
  }
}
