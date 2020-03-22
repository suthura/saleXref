class SaleItem {
  String shopID;
  String saleID;
  String total;
  String shopname;
  String saletime;

  SaleItem(
      {this.shopID, this.saleID, this.total, this.shopname, this.saletime});

  factory SaleItem.fromJson(Map<String, dynamic> json) {
    return SaleItem(
        shopID: json["shopid"] as String,
        saleID: json["_id"] as String,
        total: json["total"] as String,
        shopname: json["shopname"] as String,
        saletime: json["saletime"] as String);
  }
}
