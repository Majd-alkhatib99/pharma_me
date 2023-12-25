class MedicineModel{
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
  Category? category;

  MedicineModel(
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

  MedicineModel.fromJson(Map<String, dynamic> json) {
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
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }
}

class Category{
  int? id;
  String? catName;
  String? image;

  Category({this.id, this.catName, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catName = json['catName'];
    image = json['image'];
  }
}