// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AsyncState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, T? previousData) error,
    required TResult Function(T? previousData) loading,
    required TResult Function(T? previousData) empty,
    required TResult Function(T data) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, T? previousData)? error,
    TResult? Function(T? previousData)? loading,
    TResult? Function(T? previousData)? empty,
    TResult? Function(T data)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, T? previousData)? error,
    TResult Function(T? previousData)? loading,
    TResult Function(T? previousData)? empty,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error<T> value) error,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Data<T> value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error<T> value)? error,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Data<T> value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error<T> value)? error,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Data<T> value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncStateCopyWith<T, $Res> {
  factory $AsyncStateCopyWith(
          AsyncState<T> value, $Res Function(AsyncState<T>) then) =
      _$AsyncStateCopyWithImpl<T, $Res, AsyncState<T>>;
}

/// @nodoc
class _$AsyncStateCopyWithImpl<T, $Res, $Val extends AsyncState<T>>
    implements $AsyncStateCopyWith<T, $Res> {
  _$AsyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<T, $Res> {
  factory _$$_ErrorCopyWith(
          _$_Error<T> value, $Res Function(_$_Error<T>) then) =
      __$$_ErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, T? previousData});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<T, $Res>
    extends _$AsyncStateCopyWithImpl<T, $Res, _$_Error<T>>
    implements _$$_ErrorCopyWith<T, $Res> {
  __$$_ErrorCopyWithImpl(_$_Error<T> _value, $Res Function(_$_Error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? previousData = freezed,
  }) {
    return _then(_$_Error<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == previousData
          ? _value.previousData
          : previousData // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Error<T> extends _Error<T> {
  const _$_Error(this.message, [this.previousData]) : super._();

  @override
  final String message;
  @override
  final T? previousData;

  @override
  String toString() {
    return 'AsyncState<$T>.error(message: $message, previousData: $previousData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other.previousData, previousData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(previousData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      __$$_ErrorCopyWithImpl<T, _$_Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, T? previousData) error,
    required TResult Function(T? previousData) loading,
    required TResult Function(T? previousData) empty,
    required TResult Function(T data) data,
  }) {
    return error(message, previousData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, T? previousData)? error,
    TResult? Function(T? previousData)? loading,
    TResult? Function(T? previousData)? empty,
    TResult? Function(T data)? data,
  }) {
    return error?.call(message, previousData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, T? previousData)? error,
    TResult Function(T? previousData)? loading,
    TResult Function(T? previousData)? empty,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, previousData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error<T> value) error,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Data<T> value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error<T> value)? error,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Data<T> value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error<T> value)? error,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Data<T> value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T> extends AsyncState<T> {
  const factory _Error(final String message, [final T? previousData]) =
      _$_Error<T>;
  const _Error._() : super._();

  String get message;
  T? get previousData;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<T, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<T> value, $Res Function(_$_Loading<T>) then) =
      __$$_LoadingCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? previousData});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<T, $Res>
    extends _$AsyncStateCopyWithImpl<T, $Res, _$_Loading<T>>
    implements _$$_LoadingCopyWith<T, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<T> _value, $Res Function(_$_Loading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousData = freezed,
  }) {
    return _then(_$_Loading<T>(
      freezed == previousData
          ? _value.previousData
          : previousData // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Loading<T> extends _Loading<T> {
  const _$_Loading([this.previousData]) : super._();

  @override
  final T? previousData;

  @override
  String toString() {
    return 'AsyncState<$T>.loading(previousData: $previousData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading<T> &&
            const DeepCollectionEquality()
                .equals(other.previousData, previousData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(previousData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingCopyWith<T, _$_Loading<T>> get copyWith =>
      __$$_LoadingCopyWithImpl<T, _$_Loading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, T? previousData) error,
    required TResult Function(T? previousData) loading,
    required TResult Function(T? previousData) empty,
    required TResult Function(T data) data,
  }) {
    return loading(previousData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, T? previousData)? error,
    TResult? Function(T? previousData)? loading,
    TResult? Function(T? previousData)? empty,
    TResult? Function(T data)? data,
  }) {
    return loading?.call(previousData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, T? previousData)? error,
    TResult Function(T? previousData)? loading,
    TResult Function(T? previousData)? empty,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(previousData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error<T> value) error,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Data<T> value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error<T> value)? error,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Data<T> value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error<T> value)? error,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Data<T> value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> extends AsyncState<T> {
  const factory _Loading([final T? previousData]) = _$_Loading<T>;
  const _Loading._() : super._();

  T? get previousData;
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<T, _$_Loading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<T, $Res> {
  factory _$$_EmptyCopyWith(
          _$_Empty<T> value, $Res Function(_$_Empty<T>) then) =
      __$$_EmptyCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? previousData});
}

/// @nodoc
class __$$_EmptyCopyWithImpl<T, $Res>
    extends _$AsyncStateCopyWithImpl<T, $Res, _$_Empty<T>>
    implements _$$_EmptyCopyWith<T, $Res> {
  __$$_EmptyCopyWithImpl(_$_Empty<T> _value, $Res Function(_$_Empty<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousData = freezed,
  }) {
    return _then(_$_Empty<T>(
      freezed == previousData
          ? _value.previousData
          : previousData // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Empty<T> extends _Empty<T> {
  const _$_Empty([this.previousData]) : super._();

  @override
  final T? previousData;

  @override
  String toString() {
    return 'AsyncState<$T>.empty(previousData: $previousData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Empty<T> &&
            const DeepCollectionEquality()
                .equals(other.previousData, previousData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(previousData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmptyCopyWith<T, _$_Empty<T>> get copyWith =>
      __$$_EmptyCopyWithImpl<T, _$_Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, T? previousData) error,
    required TResult Function(T? previousData) loading,
    required TResult Function(T? previousData) empty,
    required TResult Function(T data) data,
  }) {
    return empty(previousData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, T? previousData)? error,
    TResult? Function(T? previousData)? loading,
    TResult? Function(T? previousData)? empty,
    TResult? Function(T data)? data,
  }) {
    return empty?.call(previousData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, T? previousData)? error,
    TResult Function(T? previousData)? loading,
    TResult Function(T? previousData)? empty,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(previousData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error<T> value) error,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Data<T> value) data,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error<T> value)? error,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Data<T> value)? data,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error<T> value)? error,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Data<T> value)? data,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> extends AsyncState<T> {
  const factory _Empty([final T? previousData]) = _$_Empty<T>;
  const _Empty._() : super._();

  T? get previousData;
  @JsonKey(ignore: true)
  _$$_EmptyCopyWith<T, _$_Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DataCopyWith<T, $Res> {
  factory _$$_DataCopyWith(_$_Data<T> value, $Res Function(_$_Data<T>) then) =
      __$$_DataCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$_DataCopyWithImpl<T, $Res>
    extends _$AsyncStateCopyWithImpl<T, $Res, _$_Data<T>>
    implements _$$_DataCopyWith<T, $Res> {
  __$$_DataCopyWithImpl(_$_Data<T> _value, $Res Function(_$_Data<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_Data<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Data<T> extends _Data<T> {
  const _$_Data(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'AsyncState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<T, _$_Data<T>> get copyWith =>
      __$$_DataCopyWithImpl<T, _$_Data<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, T? previousData) error,
    required TResult Function(T? previousData) loading,
    required TResult Function(T? previousData) empty,
    required TResult Function(T data) data,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, T? previousData)? error,
    TResult? Function(T? previousData)? loading,
    TResult? Function(T? previousData)? empty,
    TResult? Function(T data)? data,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, T? previousData)? error,
    TResult Function(T? previousData)? loading,
    TResult Function(T? previousData)? empty,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error<T> value) error,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Data<T> value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error<T> value)? error,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Data<T> value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error<T> value)? error,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Data<T> value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data<T> extends AsyncState<T> {
  const factory _Data(final T data) = _$_Data<T>;
  const _Data._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$$_DataCopyWith<T, _$_Data<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
