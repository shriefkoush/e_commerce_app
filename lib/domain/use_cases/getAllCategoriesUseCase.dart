import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Category_Response_Entity.dart';
import 'package:e_commerce_app2/domain/repositories/home_repository/homeRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllCategoriesUseCase{
  HomeRepository homeRepository;
  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<Failures,CategoryResponseEntity>> invoke(){
    return homeRepository.getAllCategories();
  }
}