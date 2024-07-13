const timbuImageUrl = 'https://api.timbu.cloud/images';

class ProductModel {
  ProductModel({
    required this.name,
    required this.description,
    required this.isAvailable,
    required this.imageUrl,
    required this.price,
    this.category = 'dnkf'
  });
  String name;
  String description;
  bool isAvailable;
  String imageUrl;
  double price;
  String category;

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      name: data['name'],
      description: data['description'],
      isAvailable: data['is_available'],
      imageUrl: '$timbuImageUrl/${data['photos'][0]['url']}',
      price: data['current_price'][0]['NGN'][0],
    );
  }
}
