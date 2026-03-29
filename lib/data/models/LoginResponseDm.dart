import 'package:e_commerce_app2/domain/entities/LoginResponseEntity.dart';

/// message : "success"
/// user : {"name":"Shrief Hassan","email":"shifoo242@gmail.co","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5NWZlMmUwNTQzOWRiMzdhYmRkOTAwNSIsIm5hbWUiOiJTaHJpZWYgSGFzc2FuIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3Njc5MDcyNDYsImV4cCI6MTc3NTY4MzI0Nn0.Gdkwk2Hbe5Y7W6xA5aauxMuDd-Wbyibr3GS2HS5kj1c"

class LoginResponseDm extends LoginResponseEntity{
  LoginResponseDm({
      super.message,
      super.user,
      super.token,});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDm.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? statusMsg;


}

/// name : "Shrief Hassan"
/// email : "shifoo242@gmail.co"
/// role : "user"

class LoginUserDm extends LoginUserEntity{
  LoginUserDm({
      super.name,
      super.email,
      this.role,});

  LoginUserDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;


}