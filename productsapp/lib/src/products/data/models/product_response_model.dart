class ProductResponse {
  final bool? isError;
  final int? status;
  final String? message;
  final List<ProductModel>? obj;

  ProductResponse({
    this.isError,
    this.status,
    this.message,
    this.obj,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        isError: json["is_error"],
        status: json["status"],
        message: json["message"],
        obj: json["obj"] == null
            ? []
            : List<ProductModel>.from(
                json["obj"]!.map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "is_error": isError,
        "status": status,
        "message": message,
        "obj":
            obj == null ? [] : List<dynamic>.from(obj!.map((x) => x.toJson())),
      };
}

class ProductModel {
  final int? id;
  final String? name;
  final int? price;
  final String? description;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
      };
}
