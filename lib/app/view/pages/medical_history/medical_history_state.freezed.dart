// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MedicalState {
  String get reasonForConsultation => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get medicalHistoryDate => throw _privateConstructorUsedError;
  bool get termsOK => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MedicalStateCopyWith<MedicalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalStateCopyWith<$Res> {
  factory $MedicalStateCopyWith(
          MedicalState value, $Res Function(MedicalState) then) =
      _$MedicalStateCopyWithImpl<$Res, MedicalState>;
  @useResult
  $Res call(
      {String reasonForConsultation,
      String description,
      DateTime medicalHistoryDate,
      bool termsOK});
}

/// @nodoc
class _$MedicalStateCopyWithImpl<$Res, $Val extends MedicalState>
    implements $MedicalStateCopyWith<$Res> {
  _$MedicalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonForConsultation = null,
    Object? description = null,
    Object? medicalHistoryDate = null,
    Object? termsOK = null,
  }) {
    return _then(_value.copyWith(
      reasonForConsultation: null == reasonForConsultation
          ? _value.reasonForConsultation
          : reasonForConsultation // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      medicalHistoryDate: null == medicalHistoryDate
          ? _value.medicalHistoryDate
          : medicalHistoryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicalStateImplCopyWith<$Res>
    implements $MedicalStateCopyWith<$Res> {
  factory _$$MedicalStateImplCopyWith(
          _$MedicalStateImpl value, $Res Function(_$MedicalStateImpl) then) =
      __$$MedicalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reasonForConsultation,
      String description,
      DateTime medicalHistoryDate,
      bool termsOK});
}

/// @nodoc
class __$$MedicalStateImplCopyWithImpl<$Res>
    extends _$MedicalStateCopyWithImpl<$Res, _$MedicalStateImpl>
    implements _$$MedicalStateImplCopyWith<$Res> {
  __$$MedicalStateImplCopyWithImpl(
      _$MedicalStateImpl _value, $Res Function(_$MedicalStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonForConsultation = null,
    Object? description = null,
    Object? medicalHistoryDate = null,
    Object? termsOK = null,
  }) {
    return _then(_$MedicalStateImpl(
      reasonForConsultation: null == reasonForConsultation
          ? _value.reasonForConsultation
          : reasonForConsultation // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      medicalHistoryDate: null == medicalHistoryDate
          ? _value.medicalHistoryDate
          : medicalHistoryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MedicalStateImpl implements _MedicalState {
  _$MedicalStateImpl(
      {this.reasonForConsultation = '',
      this.description = '',
      required this.medicalHistoryDate,
      this.termsOK = false});

  @override
  @JsonKey()
  final String reasonForConsultation;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime medicalHistoryDate;
  @override
  @JsonKey()
  final bool termsOK;

  @override
  String toString() {
    return 'MedicalState(reasonForConsultation: $reasonForConsultation, description: $description, medicalHistoryDate: $medicalHistoryDate, termsOK: $termsOK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicalStateImpl &&
            (identical(other.reasonForConsultation, reasonForConsultation) ||
                other.reasonForConsultation == reasonForConsultation) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.medicalHistoryDate, medicalHistoryDate) ||
                other.medicalHistoryDate == medicalHistoryDate) &&
            (identical(other.termsOK, termsOK) || other.termsOK == termsOK));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reasonForConsultation,
      description, medicalHistoryDate, termsOK);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicalStateImplCopyWith<_$MedicalStateImpl> get copyWith =>
      __$$MedicalStateImplCopyWithImpl<_$MedicalStateImpl>(this, _$identity);
}

abstract class _MedicalState implements MedicalState {
  factory _MedicalState(
      {final String reasonForConsultation,
      final String description,
      required final DateTime medicalHistoryDate,
      final bool termsOK}) = _$MedicalStateImpl;

  @override
  String get reasonForConsultation;
  @override
  String get description;
  @override
  DateTime get medicalHistoryDate;
  @override
  bool get termsOK;
  @override
  @JsonKey(ignore: true)
  _$$MedicalStateImplCopyWith<_$MedicalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
