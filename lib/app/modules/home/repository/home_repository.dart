import 'package:dartz/dartz.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';
import 'package:teste_gdm/app/modules/home/service/service.dart';

class HomeRepository {
  final HomeService _service = HomeService();

  Future<Either<Failure, List<MotelModel>>> getAllMotels() async {
    try {
      final result = await _service.getAllMotels();

      return Right(result.data?.moteis ?? <MotelModel>[]);
    } catch (e) {
      if (e is RestClientException) {
        if (e.statusCode == 400) return Left(BadRequestError(e.message));
        if (e.statusCode == 401) return Left(UnauthorizedError(e.message));
        if (e.statusCode == 500) return Left(InternalServerError(e.message));

        return Left(GenericFailure(e.message));
      }

      return Left(GenericFailure(e.toString()));
    }
  }
}
