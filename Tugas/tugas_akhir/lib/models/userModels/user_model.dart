import 'package:hive/hive.dart';

part '../catModels/user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0, defaultValue: '')
  String fullName;

  @HiveField(1, defaultValue: '')
  String email;

  @HiveField(2, defaultValue: '')
  String password;

  @HiveField(3, defaultValue: 19)
  int age;

  @HiveField(4, defaultValue: 'Male')
  String gender;

  User(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.age,
      required this.gender});
}
