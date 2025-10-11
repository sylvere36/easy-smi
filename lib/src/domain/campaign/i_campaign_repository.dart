import 'package:dartz/dartz.dart';
import '../_commons/global_failure.dart';
import 'models/campaign_item.dart';
import 'models/communication_action_plan.dart';

abstract class ICampaignRepository {
  Future<Either<GlobalFailure, List<CampaignItem>>> getCampaigns();
  Future<Either<GlobalFailure, CampaignItem>> getCampaignDetail({
    required int id,
  });
  Future<Either<GlobalFailure, List<CommunicationActionPlan>>>
  getCommunicationActionPlans({required int campaignId});
}
