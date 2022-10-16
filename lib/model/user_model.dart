class UserModel{
   String? userId , email , name ;

  UserModel({this.userId, this.email, this.name});

  UserModel.fromJson(Map<dynamic,dynamic>userMap){
    userId = userMap['userId'];
    email = userMap['email'];
    name = userMap['name'];
  }
  toJson(){
    return{
      'userId': userId,
      'email': email,
      'name': name,
    };
  }

}