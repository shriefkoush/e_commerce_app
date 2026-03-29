import '../../domain/entities/Add_to_cart_response_entity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "697e3a90b12669c239d099fa"
/// data : {"_id":"697e3a90b12669c239d099fa","cartOwner":"695fe2e05439db37abdd9005","products":[{"count":1,"_id":"697e3a90b12669c239d099fb","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2026-01-31T17:23:28.907Z","updatedAt":"2026-01-31T17:23:29.140Z","__v":0,"totalCartPrice":149}

class AddToCartResponseDm extends AddToCartResponseEntity{
  AddToCartResponseDm({
      super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
    this.statusMsg
  });

  AddToCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataDm.fromJson(json['data']) : null;
  }
  String? statusMsg;


}

/// _id : "697e3a90b12669c239d099fa"
/// cartOwner : "695fe2e05439db37abdd9005"
/// products : [{"count":1,"_id":"697e3a90b12669c239d099fb","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2026-01-31T17:23:28.907Z"
/// updatedAt : "2026-01-31T17:23:29.140Z"
/// __v : 0
/// totalCartPrice : 149

class DataDm extends DataEntity{
  DataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  DataDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }



}

/// count : 1
/// _id : "697e3a90b12669c239d099fb"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class ProductsDm extends ProductsEntity{
  ProductsDm({
    super.count,
    super.id,
    super.product,
    super.price,});

  ProductsDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }



}