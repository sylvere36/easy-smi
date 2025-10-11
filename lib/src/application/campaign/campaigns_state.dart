part of 'campaigns_bloc.dart';

@freezed
abstract class CampaignsState with _$CampaignsState {
  const factory CampaignsState({
    // list
    @Default(false) bool isLoading,
    @Default(<CampaignItem>[]) List<CampaignItem> items,
    required Option<Either<GlobalFailure, List<CampaignItem>>> resultOption,
    // detail
    @Default(false) bool isDetailLoading,
    CampaignItem? detail,
    required Option<Either<GlobalFailure, CampaignItem>> detailResultOption,
    // action plans
    @Default(false) bool isPlansLoading,
    @Default(<CommunicationActionPlan>[]) List<CommunicationActionPlan> plans,
    required Option<Either<GlobalFailure, List<CommunicationActionPlan>>>
    plansResultOption,
  }) = _CampaignsState;

  factory CampaignsState.initial() => CampaignsState(
    resultOption: none(),
    detailResultOption: none(),
    plansResultOption: none(),
  );
}
