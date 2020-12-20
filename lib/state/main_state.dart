import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_state.freezed.dart';
part 'main_state.g.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(MainPageState.HOME) MainPageState pageState,
  }) = _MainState;

 factory MainState.fromJson(Map<String, dynamic> json) => _$MainStateFromJson(json);
}

enum MainPageState {
  HOME,
  FAVORITE,
}
