import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/campaign/i_campaign_repository.dart';
import '../../domain/campaign/models/campaign_item.dart';
import '../../domain/campaign/models/communication_action_plan.dart';

part 'campaigns_bloc.freezed.dart';
part 'campaigns_event.dart';
part 'campaigns_state.dart';

class CampaignsBloc extends Bloc<CampaignsEvent, CampaignsState> {
  final ICampaignRepository repository;
  CampaignsBloc({required this.repository}) : super(CampaignsState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final res = await repository.getCampaigns();
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (items) => emit(
          state.copyWith(
            isLoading: false,
            items: items,
            resultOption: some(right(items)),
          ),
        ),
      );
    });

    on<_FetchDetailRequested>((event, emit) async {
      emit(state.copyWith(isDetailLoading: true, detailResultOption: none()));
      final res = await repository.getCampaignDetail(id: event.id);
      res.fold(
        (l) => emit(
          state.copyWith(
            isDetailLoading: false,
            detailResultOption: some(left(l)),
          ),
        ),
        (item) => emit(
          state.copyWith(
            isDetailLoading: false,
            detail: item,
            detailResultOption: some(right(item)),
          ),
        ),
      );
    });

    on<_FetchActionPlansRequested>((event, emit) async {
      emit(state.copyWith(isPlansLoading: true, plansResultOption: none()));
      final res = await repository.getCommunicationActionPlans(
        campaignId: event.campaignId,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isPlansLoading: false,
            plansResultOption: some(left(l)),
          ),
        ),
        (items) => emit(
          state.copyWith(
            isPlansLoading: false,
            plans: items,
            plansResultOption: some(right(items)),
          ),
        ),
      );
    });
  }
}
