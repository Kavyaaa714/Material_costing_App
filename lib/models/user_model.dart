import 'package:hive/hive.dart';


@HiveType(typeId: 0)
enum UserRole {
  @HiveField(0)
  Admin,
  @HiveField(1)
  Operator
}

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String username;

  @HiveField(1)
  String password;

  @HiveField(2)
  UserRole role;

  UserModel({required this.username, required this.password, required this.role});
}
