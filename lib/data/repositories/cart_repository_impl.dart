import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Cart_response_entity.dart';
import 'package:e_commerce_app2/domain/repositories/Cart_repository/Cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/data_sources/remote_data_source/cartRemoteDataSource.dart';
@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl ({required this.cartRemoteDataSource});
  @override
  Future<Either<Failures, CartResponseEntity>> getCartItems()async {
   var either = await cartRemoteDataSource.getCartItems();
   return either.fold((error)=> Left(error), (response)=> Right(response));
  }

}