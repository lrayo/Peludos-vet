// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PetsState {
  String get name => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get urlImage => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  bool get termsOK => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PetsStateCopyWith<PetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetsStateCopyWith<$Res> {
  factory $PetsStateCopyWith(PetsState value, $Res Function(PetsState) then) =
      _$PetsStateCopyWithImpl<$Res, PetsState>;
  @useResult
  $Res call(
      {String name,
      String weight,
      String breed,
      String color,
      String urlImage,
      String age,
      bool termsOK});
}

/// @nodoc
class _$PetsStateCopyWithImpl<$Res, $Val extends PetsState>
    implements $PetsStateCopyWith<$Res> {
  _$PetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? weight = null,
    Object? breed = null,
    Object? color = null,
    Object? urlImage = null,
    Object? age = null,
    Object? termsOK = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetsStateImplCopyWith<$Res>
    implements $PetsStateCopyWith<$Res> {
  factory _$$PetsStateImplCopyWith(
          _$PetsStateImpl value, $Res Function(_$PetsStateImpl) then) =
      __$$PetsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String weight,
      String breed,
      String color,
      String urlImage,
      String age,
      bool termsOK});
}

/// @nodoc
class __$$PetsStateImplCopyWithImpl<$Res>
    extends _$PetsStateCopyWithImpl<$Res, _$PetsStateImpl>
    implements _$$PetsStateImplCopyWith<$Res> {
  __$$PetsStateImplCopyWithImpl(
      _$PetsStateImpl _value, $Res Function(_$PetsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? weight = null,
    Object? breed = null,
    Object? color = null,
    Object? urlImage = null,
    Object? age = null,
    Object? termsOK = null,
  }) {
    return _then(_$PetsStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      termsOK: null == termsOK
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PetsStateImpl implements _PetsState {
  _$PetsStateImpl(
      {this.name = '',
      this.weight = '',
      this.breed = '',
      this.color = '',
      this.urlImage = '',
      this.age = '',
      this.termsOK = false});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String weight;
  @override
  @JsonKey()
  final String breed;
  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final String urlImage;
  @override
  @JsonKey()
  final String age;
  @override
  @JsonKey()
  final bool termsOK;

  @override
  String toString() {
    return 'PetsState(name: $name, weight: $weight, breed: $breed, color: $color, urlImage: $urlImage, age: $age, termsOK: $termsOK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetsStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.urlImage, urlImage) ||
                other.urlImage == urlImage) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.termsOK, termsOK) || other.termsOK == termsOK));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, weight, breed, color, urlImage, age, termsOK);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetsStateImplCopyWith<_$PetsStateImpl> get copyWith =>
      __$$PetsStateImplCopyWithImpl<_$PetsStateImpl>(this, _$identity);
}

abstract class _PetsState implements PetsState {
  factory _PetsState(
      {final String name,
      final String weight,
      final String breed,
      final String color,
      final String urlImage,
      final String age,
      final bool termsOK}) = _$PetsStateImpl;

  @override
  String get name;
  @override
  String get weight;
  @override
  String get breed;
  @override
  String get color;
  @override
  String get urlImage;
  @override
  String get age;
  @override
  bool get termsOK;
  @override
  @JsonKey(ignore: true)
  _$$PetsStateImplCopyWith<_$PetsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
