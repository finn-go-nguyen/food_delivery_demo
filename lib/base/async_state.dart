import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
class AsyncState<T> with _$AsyncState<T> {
  const AsyncState._();
  const factory AsyncState.error(String message, [T? previousData]) = _Error<T>;
  const factory AsyncState.loading([T? previousData]) = _Loading<T>;
  const factory AsyncState.empty([T? previousData]) = _Empty<T>;
  const factory AsyncState.data(T data) = _Data<T>;
}
