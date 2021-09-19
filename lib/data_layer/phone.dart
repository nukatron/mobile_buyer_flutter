import 'dart:core';

class Phone {
  final int id;
  final String name;
  final String thumbUrl;
  final double price;
  final double rating;
  String? description;
  String? brand;
  bool isFavorite = false;

  Phone({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.price,
    required this.rating,
    this.description,
    this.brand,
    this.isFavorite = false
  });

  Phone.fromJson(json)
      : id = json['id'],
        name = json['name'],
        brand = json['brand'],
        thumbUrl = json['thumbImageURL'],
        description = json['description'],
        price = json['price'].toDouble(),
        rating = json['rating'].toDouble();

  String get priceDisplay {
    return "\$${price.toStringAsFixed(2)}";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Phone && brand == other.brand && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
