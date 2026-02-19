// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokedex_palette_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokedexPalette {

 Color get primary; Color get secondary;
/// Create a copy of PokedexPalette
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokedexPaletteCopyWith<PokedexPalette> get copyWith => _$PokedexPaletteCopyWithImpl<PokedexPalette>(this as PokedexPalette, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokedexPalette&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}


@override
int get hashCode => Object.hash(runtimeType,primary,secondary);

@override
String toString() {
  return 'PokedexPalette(primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class $PokedexPaletteCopyWith<$Res>  {
  factory $PokedexPaletteCopyWith(PokedexPalette value, $Res Function(PokedexPalette) _then) = _$PokedexPaletteCopyWithImpl;
@useResult
$Res call({
 Color primary, Color secondary
});




}
/// @nodoc
class _$PokedexPaletteCopyWithImpl<$Res>
    implements $PokedexPaletteCopyWith<$Res> {
  _$PokedexPaletteCopyWithImpl(this._self, this._then);

  final PokedexPalette _self;
  final $Res Function(PokedexPalette) _then;

/// Create a copy of PokedexPalette
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = null,Object? secondary = null,}) {
  return _then(_self.copyWith(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [PokedexPalette].
extension PokedexPalettePatterns on PokedexPalette {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokedexPalette value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokedexPalette() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokedexPalette value)  $default,){
final _that = this;
switch (_that) {
case _PokedexPalette():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokedexPalette value)?  $default,){
final _that = this;
switch (_that) {
case _PokedexPalette() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color primary,  Color secondary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokedexPalette() when $default != null:
return $default(_that.primary,_that.secondary);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color primary,  Color secondary)  $default,) {final _that = this;
switch (_that) {
case _PokedexPalette():
return $default(_that.primary,_that.secondary);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color primary,  Color secondary)?  $default,) {final _that = this;
switch (_that) {
case _PokedexPalette() when $default != null:
return $default(_that.primary,_that.secondary);case _:
  return null;

}
}

}

/// @nodoc


class _PokedexPalette implements PokedexPalette {
  const _PokedexPalette({required this.primary, required this.secondary});
  

@override final  Color primary;
@override final  Color secondary;

/// Create a copy of PokedexPalette
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokedexPaletteCopyWith<_PokedexPalette> get copyWith => __$PokedexPaletteCopyWithImpl<_PokedexPalette>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokedexPalette&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}


@override
int get hashCode => Object.hash(runtimeType,primary,secondary);

@override
String toString() {
  return 'PokedexPalette(primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class _$PokedexPaletteCopyWith<$Res> implements $PokedexPaletteCopyWith<$Res> {
  factory _$PokedexPaletteCopyWith(_PokedexPalette value, $Res Function(_PokedexPalette) _then) = __$PokedexPaletteCopyWithImpl;
@override @useResult
$Res call({
 Color primary, Color secondary
});




}
/// @nodoc
class __$PokedexPaletteCopyWithImpl<$Res>
    implements _$PokedexPaletteCopyWith<$Res> {
  __$PokedexPaletteCopyWithImpl(this._self, this._then);

  final _PokedexPalette _self;
  final $Res Function(_PokedexPalette) _then;

/// Create a copy of PokedexPalette
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = null,Object? secondary = null,}) {
  return _then(_PokedexPalette(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
