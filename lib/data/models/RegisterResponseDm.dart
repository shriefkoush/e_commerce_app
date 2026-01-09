import 'package:e_commerce_app2/domain/entities/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"sherifhassanally@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5NWU1ZDJkNTQzOWRiMzdhYmRhOTJmMiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzY3NzkxOTE4LCJleHAiOjE3NzU1Njc5MTh9.hrhPFau-T9Q5MKY5DAmB9fH1aVCY348AYp8NO84_GRs"

class RegisterResponseDm extends RegisterResponseEntity{
  RegisterResponseDm({
      super.message,
      super.statusMsg,
      super.user,
      super.token,});

  RegisterResponseDm.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }



}

/// name : "Ahmed Abd Al-Muti"
/// email : "sherifhassanally@gmail.com"
/// role : "user"

class User extends UserEntity {
  User({
      super.name,
      super.email,
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? role;
}