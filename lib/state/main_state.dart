import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<String> itemList,
  }) = _MainState;
}
