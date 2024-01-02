class OrdersModel {
  int? id;
  int? userId;
  int? fromId;
  String? status;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  String? image;

  OrdersModel(
      {this.id,
        this.userId,
        this.fromId,
        this.status,
        this.paymentStatus,
        this.createdAt,
        this.updatedAt});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fromId = json['from_id'];
    status = json['status'];
    paymentStatus = json['paymentStatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}