import 'dart:convert';

// To parse this JSON data, do
//
//     final productModal = productModalFromJson(jsonString);

import 'dart:convert';

List<ProductModal> productModalFromJson(String str) => List<ProductModal>.from(json.decode(str).map((x) => ProductModal.fromJson(x)));

String productModalToJson(List<ProductModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModal {
  ProductModal({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productOffer,
    required this.productCategory,
    required this.productImage,
    required this.productDesc,
    required this.productRate,
  });

  String id;
  String productName;
  String productPrice;
  String productOffer;
  String productCategory;
  String productImage;
  String productDesc;
  String productRate;

  factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
    id: json["id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    productOffer: json["product_offer"],
    productCategory: json["product_category"],
    productImage: "product_image",
    productDesc: json["product_desc"],
    productRate: json["product_rate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_price": productPrice,
    "product_offer": productOffer,
    "product_category": productCategory,
    "product_image": productImage,
    "product_desc": productDesc,
    "product_rate": productRate,
  };
}

