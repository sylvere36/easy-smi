import 'package:dartz/dartz.dart';
import '../../domain/_commons/global_failure.dart';
import '../../domain/campaign/i_campaign_repository.dart';
import '../../domain/campaign/models/campaign_item.dart';
import '../../domain/campaign/models/communication_action_plan.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/campaign_remote_data_source.dart';

class CampaignRepository implements ICampaignRepository {
  final INetworkInfo networkInfo;
  final ICampaignRemoteDataSource remoteDataSource;
  CampaignRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, List<CampaignItem>>> getCampaigns() async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getCampaigns();
        return right(items);
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

  @override
  Future<Either<GlobalFailure, CampaignItem>> getCampaignDetail({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.getCampaignDetail(id: id);
        return right(item);
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

  @override
  Future<Either<GlobalFailure, List<CommunicationActionPlan>>>
  getCommunicationActionPlans({required int campaignId}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getCommunicationActionPlans(
          campaignId: campaignId,
        );
        return right(items);
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
