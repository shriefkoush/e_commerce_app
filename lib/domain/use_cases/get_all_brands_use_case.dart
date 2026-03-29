import 'package:dartz/dartz.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/domain/entities/Brand_response_entity.dart';
import 'package:e_commerce_app2/domain/repositories/home_repository/homeRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllBrandsUseCase {
  final HomeRepository homeRepository;

  GetAllBrandsUseCase(this.homeRepository);

  Future<Either<Failures, BrandResponseEntity>> invoke() {
    return homeRepository.getAllBrands();
  }
}
