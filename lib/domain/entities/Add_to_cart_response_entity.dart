/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "697e3a90b12669c239d099fa"
/// data : {"_id":"697e3a90b12669c239d099fa","cartOwner":"695fe2e05439db37abdd9005","products":[{"count":1,"_id":"697e3a90b12669c239d099fb","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2026-01-31T17:23:28.907Z","updatedAt":"2026-01-31T17:23:29.140Z","__v":0,"totalCartPrice":149}

class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  DataEntity? data;


}

/// _id : "697e3a90b12669c239d099fa"
/// cartOwner : "695fe2e05439db37abdd9005"
/// products : [{"count":1,"_id":"697e3a90b12669c239d099fb","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2026-01-31T17:23:28.907Z"
/// updatedAt : "2026-01-31T17:23:29.140Z"
/// __v : 0
/// totalCartPrice : 149

class DataEntity {
  DataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<ProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;


}

/// count : 1
/// _id : "697e3a90b12669c239d099fb"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class ProductsEntity {
  ProductsEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  String? product;
  num? price;


}