class CartModel {


  final int productId;
  final String color;
  final String size;
  final int qty;

  CartModel({
    required this.productId,
    required this.color,
    required this.size,
    required this.qty,
  });
  Map<String,dynamic>toJson(){
    return  {
      "product_id":productId,
      "color":color,
      "size":size,
      "qty":qty,
    };
  }

}
