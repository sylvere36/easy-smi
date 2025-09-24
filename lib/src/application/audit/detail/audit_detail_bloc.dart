import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/audit/i_audit_repository.dart';
import '../../../domain/audit/models/audit_item.dart';

part 'audit_detail_bloc.freezed.dart';
part 'audit_detail_event.dart';
part 'audit_detail_state.dart';

class AuditDetailBloc extends Bloc<AuditDetailEvent, AuditDetailState> {
  final IAuditRepository repository;
  AuditDetailBloc({required this.repository}) : super(AuditDetailState.initial()) {
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
      final res = await repository.changeStatus(id: event.id, status: event.status);
      res.fold(
        (l) => emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (message) async {
          // After a successful status change, refresh the audit detail if we have an id
          final currentId = event.id;
          final detailRes = await repository.getAudit(id: currentId);
          emit(
            detailRes.fold(
              (l) => state.copyWith(isLoading: false, resultOption: some(left(l))),
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
  }
}
