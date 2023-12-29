class SearchModel {
  int? id;
  String? scName;
  String? trName;
  int? categoryId;
  String? manufacturer;
  int? quantity;
  String? expDate;
  int? price;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? category;

  SearchModel(
      {this.id,
        this.scName,
        this.trName,
        this.categoryId,
        this.manufacturer,
        this.quantity,
        this.expDate,
        this.price,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.category});

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scName = json['scName'];
    trName = json['trName'];
    categoryId = json['category_id'];
    manufacturer = json['manufacturer'];
    quantity = json['quantity'];
    expDate = json['expDate'];
    price = json['price'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'];
  }

}