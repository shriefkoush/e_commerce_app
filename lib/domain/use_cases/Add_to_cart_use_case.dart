import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Add_to_cart_response_entity.dart';
import 'package:e_commerce_app2/domain/repositories/home_repository/homeRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;
  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures,AddToCartResponseEntity>>invoke(String productId){
   return homeRepository.addToCart(productId);
  }
}