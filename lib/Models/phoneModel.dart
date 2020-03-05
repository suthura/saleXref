class PhoneItem {
  String image;
  String brand;
  String pmodel;
  String imei;
  String capacity;
  String price;

  PhoneItem(
      {this.image,
      this.brand,
      this.pmodel,
      this.imei,
      this.capacity,
      this.price});

  factory PhoneItem.fromJson(Map<String, dynamic> json) {
    return PhoneItem(
      image: json["image"] as String,
      brand: json["Brand"] as String,
      pmodel: json["PModel"] as String,
      imei: json["IMEI"] as String,
      capacity: json["capacity"] as String,
      price: json["Price"] as String,
    );
  }
}
