/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"sherifhassanally@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5NWU1ZDJkNTQzOWRiMzdhYmRhOTJmMiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzY3NzkxOTE4LCJleHAiOjE3NzU1Njc5MTh9.hrhPFau-T9Q5MKY5DAmB9fH1aVCY348AYp8NO84_GRs"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;


}

/// name : "Ahmed Abd Al-Muti"
/// email : "sherifhassanally@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email,});

  String? name;
  String? email;



}