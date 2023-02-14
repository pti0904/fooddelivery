//https://javiercbk.github.io/json_to_dart/, postman에서 json을 복사해서 dart로 변환
class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;


  CartModel(
      {this.id,
        this.name,
        this.price,
        this.img,
        this.quantity,
        this.isExist,
        this.time
        });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['img'] = img;
    return data;
  }
}