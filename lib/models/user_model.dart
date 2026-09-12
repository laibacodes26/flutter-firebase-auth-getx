class UserModel {
  final String uid;
  final String name;
  final String email;

  UserModel({required this.uid,required this.name,required this.email});

  Map<String,dynamic> toMap()=>{'name':name,'email':email};

  factory UserModel.fromMap(String uid,Map<String,dynamic> map)=>UserModel(
    uid:uid,name:map['name']??'',email:map['email']??'');
}