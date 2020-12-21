import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_actions.freezed.dart';
part 'app_actions.g.dart';

@freezed
abstract class AppActions with _$AppActions {
  const factory AppActions.increment() = Increment;

 factory AppActions.fromJson(Map<String, dynamic> json) => _$AppActionsFromJson(json);
}
