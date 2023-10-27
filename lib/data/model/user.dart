import 'package:driver_reports/features/login/domain/entities/user.dart';

class UserModel extends UserEntity{
  UserModel({
    int? id, 
    String? email,
    String? lastName,
    String? firstName,
    String? middleName,
    DateTime? birthDay,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> map){
    return UserModel(
      email: map["email"] ?? "",       
      firstName: map["firstName"] ?? "", 
      lastName: map["lastName"] ?? "",
      middleName: map["middleName"] ?? "",
      birthDay: map["birthDay"] ?? "",
    );
  }
}
