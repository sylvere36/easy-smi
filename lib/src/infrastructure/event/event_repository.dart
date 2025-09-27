import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/event/i_event_repository.dart';
import '../../domain/event/models/event_item.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data-sources/event_remote_data_source.dart';

class EventRepository implements IEventRepository {
  final INetworkInfo networkInfo;
  final IEventRemoteDataSource remoteDataSource;
  EventRepository({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<GlobalFailure, Paginated<EventItem>>> getEvents({int perPage = 10, int page = 1}) async{
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getEvents(
          page: page,
          perPage: perPage,
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
