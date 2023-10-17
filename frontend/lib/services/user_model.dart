//basic model for now, will change it later according to our need

class UserModel {
  final String name;
  final String email;
  final String pic;
  String? phone;
  bool isFriend;

  UserModel({required this.name, required this.email, required this.pic,this.isFriend = true , this.phone});

}