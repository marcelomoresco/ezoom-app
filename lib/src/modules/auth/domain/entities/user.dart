// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String password;
  String? email;

  User({
    required this.username,
    required this.password,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
