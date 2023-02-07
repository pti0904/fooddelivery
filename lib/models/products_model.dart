//https://javiercbk.github.io/json_to_dart/, postman에서 json을 복사해서 dart로 변환


class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel>? _products;
  List<ProductModel> get products=> _products!; //get 사용
//비공개로 전환하고 late로 초기화 선언 밑에거 required로 바꿈
  Product({required totalSize,required typeId,required offset,required products}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }


  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products!.add(ProductModel.fromJson(v));
      });
    }
  }
  //루프가 반복되면서 각 제품을 ProductModel.fromJson(v)로 변환하고 _products에 추가한다.
  //컨트롤러에 이걸 추가

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_size'] = _totalSize;
    data['type_id'] = _typeId;
    data['offset'] = _offset;
    if (this.products != null) {
      data['products'] = products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['stars'] = stars;
    data['img'] = img;
    data['location'] = location;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type_id'] = typeId;
    return data;
  }
}