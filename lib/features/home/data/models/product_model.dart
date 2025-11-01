class ProductModel {
  int id;
  String name;
  String image;
  String desc;
  String price;
  String rate;

  ProductModel({
   required this.id,
   required this.desc,
   required this.name,
   required this.image,
   required this.price,
   required this.rate,
  });

  factory ProductModel.fromJson(Map<String , dynamic> json) {
    return ProductModel(
      id: json['id'],
      desc: json['description'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      rate: json['rating'],
    );
  }
}