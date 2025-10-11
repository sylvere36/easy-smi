part of 'campaigns_bloc.dart';

@freezed
abstract class CampaignsEvent with _$CampaignsEvent {
  const factory CampaignsEvent.fetchRequested() = _FetchRequested;
  const factory CampaignsEvent.fetchDetailRequested({required int id}) =
      _FetchDetailRequested;
  const factory CampaignsEvent.fetchActionPlansRequested({
    required int campaignId,
  }) = _FetchActionPlansRequested;
}
