/// message : "success"
/// user : {"name":"Shrief Hassan","email":"shifoo242@gmail.co","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5NWZlMmUwNTQzOWRiMzdhYmRkOTAwNSIsIm5hbWUiOiJTaHJpZWYgSGFzc2FuIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3Njc4OTg3MjMsImV4cCI6MTc3NTY3NDcyM30.WavAX-BxplpbKXD8Q4aUqWvb4Qp07FcgwrrJ3rL8aT8"

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user,
   // this.statusMsg,
      this.token,});

  String? message;
 // String? statusMsg;
  LoginUserEntity? user;
  String? token;


}

/// name : "Shrief Hassan"
/// email : "shifoo242@gmail.co"
/// role : "user"

class LoginUserEntity {
  LoginUserEntity({
      this.name, 
      this.email, 
      });

  String? name;
  String? email;



}