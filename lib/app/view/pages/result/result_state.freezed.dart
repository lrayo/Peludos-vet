// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultState {
  String get examName => throw _privateConstructorUsedError;
  String get pdfURL => throw _privateConstructorUsedError;
  DateTime get resultDate => throw _privateConstructorUsedError;
  bool get termsOK => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultStateCopyWith<ResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultStateCopyWith<$Res> {
  factory $ResultStateCopyWith(
          ResultState value, $Res Function(ResultState) then) =
      _$ResultStateCopyWithImpl<$Res, ResultState>;
  @useResult
  $Res call(
      {String examName, String pdfURL, DateTime resultDate, bool termsOK});
}

/// @nodoc
class _$ResultStateCopyWithImpl<$Res, $Val extends ResultState>
    implements $ResultStateCopyWith<$Res> {
  _$ResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? examName = null,
    Object? pdfURL = null,
    Object? resultDate = null,
    Object? termsOK = null,
  }) {
    return _then(_value.copyWith(
      examName: null == examName
          ? _value.examName
          : examName // ignore: cast_nullable_to_non_nullable
              as String,
      pdfURL: null == pdfURL
          ? _value.pdfURL
          : pdfURL // ignore: cast_nullable_to_non_nullable
              as String,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultStateImplCopyWith<$Res>
    implements $ResultStateCopyWith<$Res> {
  factory _$$ResultStateImplCopyWith(
          _$ResultStateImpl value, $Res Function(_$ResultStateImpl) then) =
      __$$ResultStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String examName, String pdfURL, DateTime resultDate, bool termsOK});
}

/// @nodoc
class __$$ResultStateImplCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$ResultStateImpl>
    implements _$$ResultStateImplCopyWith<$Res> {
  __$$ResultStateImplCopyWithImpl(
      _$ResultStateImpl _value, $Res Function(_$ResultStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? examName = null,
    Object? pdfURL = null,
    Object? resultDate = null,
    Object? termsOK = null,
  }) {
    return _then(_$ResultStateImpl(
      examName: null == examName
          ? _value.examName
          : examName // ignore: cast_nullable_to_non_nullable
              as String,
      pdfURL: null == pdfURL
          ? _value.pdfURL
          : pdfURL // ignore: cast_nullable_to_non_nullable
              as String,
      resultDate: null == resultDate
          ? _value.resultDate
          : resultDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ResultStateImpl implements _ResultState {
  _$ResultStateImpl(
      {this.examName = '',
      this.pdfURL = '',
      required this.resultDate,
      this.termsOK = false});

  @override
  @JsonKey()
  final String examName;
  @override
  @JsonKey()
  final String pdfURL;
  @override
  final DateTime resultDate;
  @override
  @JsonKey()
  final bool termsOK;

  @override
  String toString() {
    return 'ResultState(examName: $examName, pdfURL: $pdfURL, resultDate: $resultDate, termsOK: $termsOK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultStateImpl &&
            (identical(other.examName, examName) ||
                other.examName == examName) &&
            (identical(other.pdfURL, pdfURL) || other.pdfURL == pdfURL) &&
            (identical(other.resultDate, resultDate) ||
                other.resultDate == resultDate) &&
            (identical(other.termsOK, termsOK) || other.termsOK == termsOK));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, examName, pdfURL, resultDate, termsOK);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultStateImplCopyWith<_$ResultStateImpl> get copyWith =>
      __$$ResultStateImplCopyWithImpl<_$ResultStateImpl>(this, _$identity);
}

abstract class _ResultState implements ResultState {
  factory _ResultState(
      {final String examName,
      final String pdfURL,
      required final DateTime resultDate,
      final bool termsOK}) = _$ResultStateImpl;

  @override
  String get examName;
  @override
  String get pdfURL;
  @override
  DateTime get resultDate;
  @override
  bool get termsOK;
  @override
  @JsonKey(ignore: true)
  _$$ResultStateImplCopyWith<_$ResultStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
