class ShopItem {
  String name;
  String addl1;
  String addl2;
  String city;
  String phone;
  String refID;

  ShopItem(
      {this.name,
      this.addl1,
      this.addl2,
      this.city,
      this.phone,
      this.refID});

  factory ShopItem.fromJson(Map<String, dynamic> json) {
    return ShopItem(
      name: json["Name"] as String,
      addl1: json["Add_l1"] as String,
      addl2: json["Add_l2"] as String,
      city: json["City"] as String,
      phone: json["Phone"] as String,
      refID: json["refID"] as String,
    );
  }
}
