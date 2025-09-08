import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_event.dart';
part 'connected_state.dart';
part 'connected_bloc.freezed.dart';

class ConnectedBloc extends Bloc<ConnectedEvent, ConnectedState> {
  StreamSubscription? subscription;

  ConnectedBloc() : super(const _Initial()) {
    on<OnConnected>((event, emit) => emit(const ConnectedSucessState()));
    on<OnNotConnected>((event, emit) => emit(const ConnectedFailureState()));

    subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      if (results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi)) {
        add(const OnConnected());
      } else {
        add(const OnNotConnected());
      }
    });
  }
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
