import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final int? id;
  final String? email;
  final String? lastName;
  final String? firstName;
  final String? middleName;
  final DateTime? birthDay;
  
  const UserEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.birthDay,
});
 
  @override
  List<Object?> get props{
    return[
      id,
      email,
      firstName,
      lastName,
      middleName,
      birthDay,
    ];
  }
}