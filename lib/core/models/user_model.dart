class UserModel {
  int? roleId;
  String? name;
  String? phone;
  String? email;
  String? message;

  // String tokenType;
  String token;

  UserModel(
      {required this.roleId,
        required this.name,
        required this.phone,
        required this.email,
        required this.message,
        required  this.token});

  factory UserModel.fromJson(dynamic data) {
    return UserModel(
       roleId:  data["0"]["user"]["role_id"],
       name:  data["0"]["user"]["name"],
       phone:  data["0"]["user"]["phone"],
        email: data["0"]["user"]["email"],
        message: data["message"],
        token: data["0"]["access_token"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'email = $email  ,  phone = $phone , name = $name message = $message  login token = $token';
  }
}
