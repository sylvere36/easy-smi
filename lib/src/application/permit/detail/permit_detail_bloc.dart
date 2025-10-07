import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/_commons/pagination.dart';
import '../../../domain/permit/i_permit_repository.dart';
import '../../../domain/permit/models/permit_detail.dart';
import '../../../domain/permit/models/permit_personnel_assignment.dart';
import '../../../domain/permit/models/permit_type_control.dart';
import '../../../domain/permit/models/permit_fire_control.dart';
import '../../../domain/permit/models/permit_risk_assessment.dart';

part 'permit_detail_bloc.freezed.dart';
part 'permit_detail_event.dart';
part 'permit_detail_state.dart';

class PermitDetailBloc extends Bloc<PermitDetailEvent, PermitDetailState> {
  final IPermitRepository repository;
  PermitDetailBloc({required this.repository})
    : super(PermitDetailState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), item: null));
      final res = await repository.getPermit(id: event.id);
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (item) => emit(
          state.copyWith(
            isLoading: false,
            item: item,
            resultOption: some(right(item)),
          ),
        ),
      );
    });

    on<_Reset>((event, emit) async {
      emit(PermitDetailState.initial());
    });

    on<_PersonnelRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingPersonnel: true,
          personnelResultOption: none(),
          // when fresh request, reset list and page
          personnel: [],
          personnelCurrentPage: 0,
          personnelCanLoadMore: true,
        ),
      );
      final res = await repository.getPermitPersonnel(
        id: event.id,
        page: 1,
        perPage: state.personnelPerPage,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingPersonnel: false,
            personnelResultOption: some(left(l)),
          ),
        ),
        (paginated) {
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoadingPersonnel: false,
              personnel: paginated.items,
              personnelCurrentPage: paginated.pagination.currentPage,
              personnelTotal: paginated.pagination.total,
              personnelCanLoadMore: canLoadMore,
              personnelResultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_PersonnelNextPageRequested>((event, emit) async {
      if (!state.personnelCanLoadMore || state.isLoadingPersonnel) return;
      emit(
        state.copyWith(isLoadingPersonnel: true, personnelResultOption: none()),
      );
      final nextPage = state.personnelCurrentPage + 1;
      final res = await repository.getPermitPersonnel(
        id: event.id,
        page: nextPage,
        perPage: state.personnelPerPage,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingPersonnel: false,
            personnelResultOption: some(left(l)),
          ),
        ),
        (paginated) {
          final newItems = List<PermitPersonnelAssignment>.from(state.personnel)
            ..addAll(paginated.items);
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoadingPersonnel: false,
              personnel: newItems,
              personnelCurrentPage: paginated.pagination.currentPage,
              personnelTotal: paginated.pagination.total,
              personnelCanLoadMore: canLoadMore,
              personnelResultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_TypeControlsRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingTypeControls: true,
          typeControlsResultOption: none(),
          typeControls: [],
          typeControlsCurrentPage: 0,
          typeControlsCanLoadMore: true,
        ),
      );
      final res = await repository.getPermitTypeControls(
        id: event.id,
        page: 1,
        perPage: state.typeControlsPerPage,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingTypeControls: false,
            typeControlsResultOption: some(left(l)),
          ),
        ),
        (paginated) {
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoadingTypeControls: false,
              typeControls: paginated.items,
              typeControlsCurrentPage: paginated.pagination.currentPage,
              typeControlsTotal: paginated.pagination.total,
              typeControlsCanLoadMore: canLoadMore,
              typeControlsResultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_TypeControlsNextPageRequested>((event, emit) async {
      if (!state.typeControlsCanLoadMore || state.isLoadingTypeControls) return;
      emit(
        state.copyWith(
          isLoadingTypeControls: true,
          typeControlsResultOption: none(),
        ),
      );
      final nextPage = state.typeControlsCurrentPage + 1;
      final res = await repository.getPermitTypeControls(
        id: event.id,
        page: nextPage,
        perPage: state.typeControlsPerPage,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingTypeControls: false,
            typeControlsResultOption: some(left(l)),
          ),
        ),
        (paginated) {
          final newItems = List<PermitTypeControl>.from(state.typeControls)
            ..addAll(paginated.items);
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoadingTypeControls: false,
              typeControls: newItems,
              typeControlsCurrentPage: paginated.pagination.currentPage,
              typeControlsTotal: paginated.pagination.total,
              typeControlsCanLoadMore: canLoadMore,
              typeControlsResultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_FireControlsRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingFireControls: true,
          fireControlsResultOption: none(),
          fireControls: [],
          fireControlsCurrentPage: 0,
          fireControlsCanLoadMore: true,
        ),
      );
      final res = await repository.getPermitFireControls(
        id: event.id,
        page: 1,
        perPage: state.fireControlsPerPage,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingFireControls: false,
            fireControlsResultOption: some(left(l)),
          ),
        ),
        (paginated) {
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoadingFireControls: false,
              fireControls: paginated.items,
              fireControlsCurrentPage: paginated.pagination.currentPage,
              fireControlsTotal: paginated.pagination.total,
              fireControlsCanLoadMore: canLoadMore,
              fireControlsResultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_FireControlsNextPageRequested>((event, emit) async {
      if (!state.fireControlsCanLoadMore || state.isLoadingFireControls) return;
      emit(
        state.copyWith(
          isLoadingFireControls: true,
          fireControlsResultOption: none(),
        ),
      );
      final nextPage = state.fireControlsCurrentPage + 1;
      final res = await repository.getPermitFireControls(
        id: event.id,
        page: nextPage,
        perPage: state.fireControlsPerPage,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingFireControls: false,
            fireControlsResultOption: some(left(l)),
          ),
        ),
        (paginated) {
          final newItems = List<PermitFireControl>.from(state.fireControls)
            ..addAll(paginated.items);
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoadingFireControls: false,
              fireControls: newItems,
              fireControlsCurrentPage: paginated.pagination.currentPage,
              fireControlsTotal: paginated.pagination.total,
              fireControlsCanLoadMore: canLoadMore,
              fireControlsResultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_RiskAssessmentsRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingRiskAssessments: true,
          riskAssessmentsResultOption: none(),
          riskAssessments: [],
          riskAssessmentsCurrentPage: 0,
          riskAssessmentsCanLoadMore: true,
        ),
      );
      final res = await repository.getPermitRiskAssessments(
        id: event.id,
        page: 1,
        perPage: state.riskAssessmentsPerPage,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingRiskAssessments: false,
            riskAssessmentsResultOption: some(left(l)),
          ),
        ),
        (paginated) {
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoadingRiskAssessments: false,
              riskAssessments: paginated.items,
              riskAssessmentsCurrentPage: paginated.pagination.currentPage,
              riskAssessmentsTotal: paginated.pagination.total,
              riskAssessmentsCanLoadMore: canLoadMore,
              riskAssessmentsResultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_RiskAssessmentsNextPageRequested>((event, emit) async {
      if (!state.riskAssessmentsCanLoadMore || state.isLoadingRiskAssessments) {
        return;
      }
      emit(
        state.copyWith(
          isLoadingRiskAssessments: true,
          riskAssessmentsResultOption: none(),
        ),
      );
      final nextPage = state.riskAssessmentsCurrentPage + 1;
      final res = await repository.getPermitRiskAssessments(
        id: event.id,
        page: nextPage,
        perPage: state.riskAssessmentsPerPage,
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingRiskAssessments: false,
            riskAssessmentsResultOption: some(left(l)),
          ),
        ),
        (paginated) {
          final newItems = List<PermitRiskAssessment>.from(
            state.riskAssessments,
          )..addAll(paginated.items);
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoadingRiskAssessments: false,
              riskAssessments: newItems,
              riskAssessmentsCurrentPage: paginated.pagination.currentPage,
              riskAssessmentsTotal: paginated.pagination.total,
              riskAssessmentsCanLoadMore: canLoadMore,
              riskAssessmentsResultOption: some(right(paginated)),
            ),
          );
        },
      );
    });
  }
}
