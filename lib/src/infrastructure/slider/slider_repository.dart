import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/slider/i_slider_repository.dart';
import '../../domain/slider/models/slider_item.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/slider_remote_data_source.dart';

class SliderRepository implements ISliderRepository {
  final INetworkInfo networkInfo;
  final ISliderRemoteDataSource remoteDataSource;
  SliderRepository({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<GlobalFailure, Paginated<SliderItem>>> getSliders({
    int page = 1,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getSliders(
          page: page,
        );
        return right(Paginated(items: items, pagination: pagination));
      } on UnauthorizedException catch (e) {
        return left(GlobalFailure.unauthorized(e.errorText));
      } on ServerException catch (e) {
        if (e.errorText.isNotEmpty) {
          return left(GlobalFailure.serverError(e.errorText));
        }
        return left(const GlobalFailure.serverError(null));
      }
    }
    return left(const GlobalFailure.noNetwork());
  }
}
