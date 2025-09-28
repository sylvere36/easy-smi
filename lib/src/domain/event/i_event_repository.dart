import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/cause_analysis.dart';
import 'models/event_item.dart';

abstract class IEventRepository {
  Future<Either<GlobalFailure, Paginated<EventItem>>> getEvents({int perPage=10, int page=1});
  Future<Either<GlobalFailure, List<CauseAnalysis>>> getCauseAnalysis({required int event});


}
