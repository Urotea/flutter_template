import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_actions.freezed.dart';

@freezed
abstract class AppActions with _$AppActions {
  const factory AppActions.addItem() = AddItem;
}
