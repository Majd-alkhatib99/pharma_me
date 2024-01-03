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
  Cat? category;
  User? user;

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
        this.category,
        this.user});

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
    category = json['category'] != null
        ? Cat.fromJson(json['category'])
        : null;
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

}

class Cat {
  int? id;
  String? catName;
  String? image;

  Cat({this.id, this.catName, this.image});

  Cat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catName = json['catName'];
    image = json['image'];
  }

}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}