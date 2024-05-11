// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dewormig_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DewormigState {
  String get nameDeworming => throw _privateConstructorUsedError;
  DateTime get dewormingDate => throw _privateConstructorUsedError;
  bool get termsOK => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DewormigStateCopyWith<DewormigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DewormigStateCopyWith<$Res> {
  factory $DewormigStateCopyWith(
          DewormigState value, $Res Function(DewormigState) then) =
      _$DewormigStateCopyWithImpl<$Res, DewormigState>;
  @useResult
  $Res call({String nameDeworming, DateTime dewormingDate, bool termsOK});
}

/// @nodoc
class _$DewormigStateCopyWithImpl<$Res, $Val extends DewormigState>
    implements $DewormigStateCopyWith<$Res> {
  _$DewormigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameDeworming = null,
    Object? dewormingDate = null,
    Object? termsOK = null,
  }) {
    return _then(_value.copyWith(
      nameDeworming: null == nameDeworming
          ? _value.nameDeworming
          : nameDeworming // ignore: cast_nullable_to_non_nullable
              as String,
      dewormingDate: null == dewormingDate
          ? _value.dewormingDate
          : dewormingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DewormigStateImplCopyWith<$Res>
    implements $DewormigStateCopyWith<$Res> {
  factory _$$DewormigStateImplCopyWith(
          _$DewormigStateImpl value, $Res Function(_$DewormigStateImpl) then) =
      __$$DewormigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nameDeworming, DateTime dewormingDate, bool termsOK});
}

/// @nodoc
class __$$DewormigStateImplCopyWithImpl<$Res>
    extends _$DewormigStateCopyWithImpl<$Res, _$DewormigStateImpl>
    implements _$$DewormigStateImplCopyWith<$Res> {
  __$$DewormigStateImplCopyWithImpl(
      _$DewormigStateImpl _value, $Res Function(_$DewormigStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameDeworming = null,
    Object? dewormingDate = null,
    Object? termsOK = null,
  }) {
    return _then(_$DewormigStateImpl(
      nameDeworming: null == nameDeworming
          ? _value.nameDeworming
          : nameDeworming // ignore: cast_nullable_to_non_nullable
              as String,
      dewormingDate: null == dewormingDate
          ? _value.dewormingDate
          : dewormingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DewormigStateImpl implements _DewormigState {
  _$DewormigStateImpl(
      {this.nameDeworming = '',
      required this.dewormingDate,
      this.termsOK = false});

  @override
  @JsonKey()
  final String nameDeworming;
  @override
  final DateTime dewormingDate;
  @override
  @JsonKey()
  final bool termsOK;

  @override
  String toString() {
    return 'DewormigState(nameDeworming: $nameDeworming, dewormingDate: $dewormingDate, termsOK: $termsOK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DewormigStateImpl &&
            (identical(other.nameDeworming, nameDeworming) ||
                other.nameDeworming == nameDeworming) &&
            (identical(other.dewormingDate, dewormingDate) ||
                other.dewormingDate == dewormingDate) &&
            (identical(other.termsOK, termsOK) || other.termsOK == termsOK));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nameDeworming, dewormingDate, termsOK);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DewormigStateImplCopyWith<_$DewormigStateImpl> get copyWith =>
      __$$DewormigStateImplCopyWithImpl<_$DewormigStateImpl>(this, _$identity);
}

abstract class _DewormigState implements DewormigState {
  factory _DewormigState(
      {final String nameDeworming,
      required final DateTime dewormingDate,
      final bool termsOK}) = _$DewormigStateImpl;

  @override
  String get nameDeworming;
  @override
  DateTime get dewormingDate;
  @override
  bool get termsOK;
  @override
  @JsonKey(ignore: true)
  _$$DewormigStateImplCopyWith<_$DewormigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
