class SingleSaleItem {
  String brand;
  String pmodel;
  String imei;
  String capacity;
  String price;
  String itmid;

  SingleSaleItem(
      {
      this.brand,
      this.pmodel,
      this.imei,
      this.capacity,
      this.price,
      this.itmid
      });

  factory SingleSaleItem.fromJson(Map<String, dynamic> json) {
    return SingleSaleItem(
      brand: json["brand"] as String,
      pmodel: json["model"] as String,
      imei: json["imei"] as String,
      capacity: json["capacity"] as String,
      price: json["price"] as String,
      itmid: json["_id"] as String,
    );
  }
}
