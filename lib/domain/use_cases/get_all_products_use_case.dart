import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Product_response_entity.dart';
import 'package:e_commerce_app2/domain/repositories/product_repository/Product_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllProductsUseCase {
  ProductRepository productRepository;
  GetAllProductsUseCase({required this.productRepository});
  Future<Either<Failures,ProductResponseEntity>> invoke(){
   return productRepository.getAllProducts();
  }
}