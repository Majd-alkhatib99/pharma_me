class OrderModel{
  int? medicineId;
  String? name;
  int? qty;
  OrderModel(int this.medicineId, int this.qty,String this.name);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['medicine_id'] = medicineId;
    data['qty'] = qty;
    return data;
  }
}

class Item{
  int? medicineId;
  int? qty;

  Item(int this.medicineId, int this.qty);

}