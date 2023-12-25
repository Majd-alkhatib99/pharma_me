class WarehouseModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  int? roleId;

  WarehouseModel(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.roleId,});

  WarehouseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    roleId = json['role_id'];
  }


}