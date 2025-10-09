import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/_commons/pagination.dart';
import '../../../domain/audit/i_audit_repository.dart';
import '../../../domain/audit/models/audit_conclusion.dart';
import '../../../domain/audit/models/audit_document_request.dart';
import '../../../domain/audit/models/audit_item.dart';
import '../../../domain/audit/models/audit_observation.dart';
import '../../../domain/audit/models/audit_result.dart';

part 'audit_detail_bloc.freezed.dart';
part 'audit_detail_event.dart';
part 'audit_detail_state.dart';

class AuditDetailBloc extends Bloc<AuditDetailEvent, AuditDetailState> {
  final IAuditRepository repository;
  AuditDetailBloc({required this.repository})
    : super(AuditDetailState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), item: null));
      final res = await repository.getAudit(id: event.id);
      emit(
        res.fold(
          (l) => state.copyWith(isLoading: false, resultOption: some(left(l))),
          (item) => state.copyWith(
            isLoading: false,
            item: item,
            resultOption: some(right(item)),
          ),
        ),
      );
    });

    on<_Reset>((event, emit) async {
      emit(state.copyWith(isLoading: false, resultOption: none(), item: null));
    });

    on<_ChangeStatus>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await repository.changeStatus(
        id: event.id,
        status: event.status,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (message) async {
          // After a successful status change, refresh the audit detail if we have an id
          final currentId = event.id;
          final detailRes = await repository.getAudit(id: currentId);
          emit(
            detailRes.fold(
              (l) =>
                  state.copyWith(isLoading: false, resultOption: some(left(l))),
              (item) => state.copyWith(
                isLoading: false,
                item: item,
                resultOption: some(right(item)),
              ),
            ),
          );
        },
      );
    });

    on<_DocumentsRequested>((event, emit) async {
      emit(
        state.copyWith(isLoadingDocuments: true, documentsResultOption: none()),
      );
      final res = await repository.getAuditDocumentRequests(id: event.id);
      emit(
        res.fold(
          (l) => state.copyWith(
            isLoadingDocuments: false,
            documentsResultOption: some(left(l)),
          ),
          (items) => state.copyWith(
            isLoadingDocuments: false,
            documentRequests: items,
            documentsResultOption: some(right(items)),
          ),
        ),
      );
    });

    on<_ObservationsRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingObservations: true,
          observationsResultOption: none(),
        ),
      );
      final int page = event.page ?? 1;
      final int perPage = event.perPage ?? 10;
      final res = await repository.getAuditObservations(
        id: event.id,
        page: page,
        perPage: perPage,
      );
      emit(
        res.fold(
          (l) => state.copyWith(
            isLoadingObservations: false,
            observationsResultOption: some(left(l)),
          ),
          (paginated) => state.copyWith(
            isLoadingObservations: false,
            observations: paginated.items,
            observationsPagination: paginated.pagination,
            observationsResultOption: some(right(paginated)),
          ),
        ),
      );
    });

    on<_ObservationsNextPageRequested>((event, emit) async {
      final currentPag = state.observationsPagination;
      if (currentPag == null) return;
      final nextPage = currentPag.currentPage + 1;
      if (nextPage > currentPag.lastPage) return; // no more pages
      emit(state.copyWith(isLoadingObservations: true));
      final res = await repository.getAuditObservations(
        id: event.id,
        page: nextPage,
        perPage: currentPag.perPage,
      );
      emit(
        res.fold(
          (l) => state.copyWith(
            isLoadingObservations: false,
            observationsResultOption: some(left(l)),
          ),
          (paginated) => state.copyWith(
            isLoadingObservations: false,
            observations: [...state.observations, ...paginated.items],
            observationsPagination: paginated.pagination,
            observationsResultOption: some(right(paginated)),
          ),
        ),
      );
    });

    on<_ConclusionRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingConclusion: true,
          conclusionResultOption: none(),
        ),
      );
      final res = await repository.getAuditConclusion(id: event.id);
      emit(
        res.fold(
          (l) => state.copyWith(
            isLoadingConclusion: false,
            conclusionResultOption: some(left(l)),
          ),
          (data) => state.copyWith(
            isLoadingConclusion: false,
            conclusion: data,
            conclusionResultOption: some(right(data)),
          ),
        ),
      );
    });

    on<_FetchResults>((event, emit) async {
      emit(state.copyWith(isLoadingResults: true, resultsResultOption: none()));
      final res = await repository.getAuditResults(id: event.id);
      emit(
        res.fold(
          (l) => state.copyWith(
            isLoadingResults: false,
            resultsResultOption: some(left(l)),
          ),
          (items) => state.copyWith(
            isLoadingResults: false,
            results: items,
            resultsResultOption: some(right(items)),
          ),
        ),
      );
    });

    on<_AddObservation>((event, emit) async {
      emit(
        state.copyWith(
          isAddingObservation: true,
          addObservationResultOption: none(),
        ),
      );
      final res = await repository.addAuditObservation(
        id: event.id,
        description: event.description,
        commentaireId: event.commentaireId,
        documents: event.documents,
      );
      emit(
        res.fold(
          (l) => state.copyWith(
            isAddingObservation: false,
            addObservationResultOption: some(left(l)),
          ),
          (item) => state.copyWith(
            isAddingObservation: false,
            observations: [item, ...state.observations],
            addObservationResultOption: some(right(item)),
          ),
        ),
      );
    });
  }
}
