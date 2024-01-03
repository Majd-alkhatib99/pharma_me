class OrdersModel {
  int? id;
  int? userId;
  int? fromId;
  String? status;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  String? image;
  int? totalPrice;

  OrdersModel(
      {this.id,
        this.userId,
        this.fromId,
        this.status,
        this.paymentStatus,
        this.createdAt,
        this.updatedAt,
        this.totalPrice});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fromId = json['from_id'];
    status = json['status'];
    paymentStatus = json['paymentStatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalPrice = json['totalPrice'];
  }

}