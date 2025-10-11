import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/slider_item.dart';

abstract class ISliderRepository {
  Future<Either<GlobalFailure, Paginated<SliderItem>>> getSliders({int page});
}
