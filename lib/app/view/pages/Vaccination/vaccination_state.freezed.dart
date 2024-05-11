// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VaccinationState {
  String get nameVaccination => throw _privateConstructorUsedError;
  String get lote => throw _privateConstructorUsedError;
  DateTime get vaccinationDate => throw _privateConstructorUsedError;
  bool get termsOK => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VaccinationStateCopyWith<VaccinationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccinationStateCopyWith<$Res> {
  factory $VaccinationStateCopyWith(
          VaccinationState value, $Res Function(VaccinationState) then) =
      _$VaccinationStateCopyWithImpl<$Res, VaccinationState>;
  @useResult
  $Res call(
      {String nameVaccination,
      String lote,
      DateTime vaccinationDate,
      bool termsOK});
}

/// @nodoc
class _$VaccinationStateCopyWithImpl<$Res, $Val extends VaccinationState>
    implements $VaccinationStateCopyWith<$Res> {
  _$VaccinationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameVaccination = null,
    Object? lote = null,
    Object? vaccinationDate = null,
    Object? termsOK = null,
  }) {
    return _then(_value.copyWith(
      nameVaccination: null == nameVaccination
          ? _value.nameVaccination
          : nameVaccination // ignore: cast_nullable_to_non_nullable
              as String,
      lote: null == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String,
      vaccinationDate: null == vaccinationDate
          ? _value.vaccinationDate
          : vaccinationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccinationStateImplCopyWith<$Res>
    implements $VaccinationStateCopyWith<$Res> {
  factory _$$VaccinationStateImplCopyWith(_$VaccinationStateImpl value,
          $Res Function(_$VaccinationStateImpl) then) =
      __$$VaccinationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nameVaccination,
      String lote,
      DateTime vaccinationDate,
      bool termsOK});
}

/// @nodoc
class __$$VaccinationStateImplCopyWithImpl<$Res>
    extends _$VaccinationStateCopyWithImpl<$Res, _$VaccinationStateImpl>
    implements _$$VaccinationStateImplCopyWith<$Res> {
  __$$VaccinationStateImplCopyWithImpl(_$VaccinationStateImpl _value,
      $Res Function(_$VaccinationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameVaccination = null,
    Object? lote = null,
    Object? vaccinationDate = null,
    Object? termsOK = null,
  }) {
    return _then(_$VaccinationStateImpl(
      nameVaccination: null == nameVaccination
          ? _value.nameVaccination
          : nameVaccination // ignore: cast_nullable_to_non_nullable
              as String,
      lote: null == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String,
      vaccinationDate: null == vaccinationDate
          ? _value.vaccinationDate
          : vaccinationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VaccinationStateImpl implements _VaccinationState {
  _$VaccinationStateImpl(
      {this.nameVaccination = '',
      this.lote = '',
      required this.vaccinationDate,
      this.termsOK = false});

  @override
  @JsonKey()
  final String nameVaccination;
  @override
  @JsonKey()
  final String lote;
  @override
  final DateTime vaccinationDate;
  @override
  @JsonKey()
  final bool termsOK;

  @override
  String toString() {
    return 'VaccinationState(nameVaccination: $nameVaccination, lote: $lote, vaccinationDate: $vaccinationDate, termsOK: $termsOK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccinationStateImpl &&
            (identical(other.nameVaccination, nameVaccination) ||
                other.nameVaccination == nameVaccination) &&
            (identical(other.lote, lote) || other.lote == lote) &&
            (identical(other.vaccinationDate, vaccinationDate) ||
                other.vaccinationDate == vaccinationDate) &&
            (identical(other.termsOK, termsOK) || other.termsOK == termsOK));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nameVaccination, lote, vaccinationDate, termsOK);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccinationStateImplCopyWith<_$VaccinationStateImpl> get copyWith =>
      __$$VaccinationStateImplCopyWithImpl<_$VaccinationStateImpl>(
          this, _$identity);
}

abstract class _VaccinationState implements VaccinationState {
  factory _VaccinationState(
      {final String nameVaccination,
      final String lote,
      required final DateTime vaccinationDate,
      final bool termsOK}) = _$VaccinationStateImpl;

  @override
  String get nameVaccination;
  @override
  String get lote;
  @override
  DateTime get vaccinationDate;
  @override
  bool get termsOK;
  @override
  @JsonKey(ignore: true)
  _$$VaccinationStateImplCopyWith<_$VaccinationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
