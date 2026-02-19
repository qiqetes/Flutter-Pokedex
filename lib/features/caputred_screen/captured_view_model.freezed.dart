// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'captured_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CapturedViewState {

 List<Pokemon> get pokemons; PokedexPalette get palette;
/// Create a copy of CapturedViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CapturedViewStateCopyWith<CapturedViewState> get copyWith => _$CapturedViewStateCopyWithImpl<CapturedViewState>(this as CapturedViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CapturedViewState&&const DeepCollectionEquality().equals(other.pokemons, pokemons)&&(identical(other.palette, palette) || other.palette == palette));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pokemons),palette);

@override
String toString() {
  return 'CapturedViewState(pokemons: $pokemons, palette: $palette)';
}


}

/// @nodoc
abstract mixin class $CapturedViewStateCopyWith<$Res>  {
  factory $CapturedViewStateCopyWith(CapturedViewState value, $Res Function(CapturedViewState) _then) = _$CapturedViewStateCopyWithImpl;
@useResult
$Res call({
 List<Pokemon> pokemons, PokedexPalette palette
});


$PokedexPaletteCopyWith<$Res> get palette;

}
/// @nodoc
class _$CapturedViewStateCopyWithImpl<$Res>
    implements $CapturedViewStateCopyWith<$Res> {
  _$CapturedViewStateCopyWithImpl(this._self, this._then);

  final CapturedViewState _self;
  final $Res Function(CapturedViewState) _then;

/// Create a copy of CapturedViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pokemons = null,Object? palette = null,}) {
  return _then(_self.copyWith(
pokemons: null == pokemons ? _self.pokemons : pokemons // ignore: cast_nullable_to_non_nullable
as List<Pokemon>,palette: null == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as PokedexPalette,
  ));
}
/// Create a copy of CapturedViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokedexPaletteCopyWith<$Res> get palette {
  
  return $PokedexPaletteCopyWith<$Res>(_self.palette, (value) {
    return _then(_self.copyWith(palette: value));
  });
}
}


/// Adds pattern-matching-related methods to [CapturedViewState].
extension CapturedViewStatePatterns on CapturedViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CapturedViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CapturedViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CapturedViewState value)  $default,){
final _that = this;
switch (_that) {
case _CapturedViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CapturedViewState value)?  $default,){
final _that = this;
switch (_that) {
case _CapturedViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Pokemon> pokemons,  PokedexPalette palette)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CapturedViewState() when $default != null:
return $default(_that.pokemons,_that.palette);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Pokemon> pokemons,  PokedexPalette palette)  $default,) {final _that = this;
switch (_that) {
case _CapturedViewState():
return $default(_that.pokemons,_that.palette);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Pokemon> pokemons,  PokedexPalette palette)?  $default,) {final _that = this;
switch (_that) {
case _CapturedViewState() when $default != null:
return $default(_that.pokemons,_that.palette);case _:
  return null;

}
}

}

/// @nodoc


class _CapturedViewState implements CapturedViewState {
  const _CapturedViewState({required final  List<Pokemon> pokemons, required this.palette}): _pokemons = pokemons;
  

 final  List<Pokemon> _pokemons;
@override List<Pokemon> get pokemons {
  if (_pokemons is EqualUnmodifiableListView) return _pokemons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pokemons);
}

@override final  PokedexPalette palette;

/// Create a copy of CapturedViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CapturedViewStateCopyWith<_CapturedViewState> get copyWith => __$CapturedViewStateCopyWithImpl<_CapturedViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CapturedViewState&&const DeepCollectionEquality().equals(other._pokemons, _pokemons)&&(identical(other.palette, palette) || other.palette == palette));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pokemons),palette);

@override
String toString() {
  return 'CapturedViewState(pokemons: $pokemons, palette: $palette)';
}


}

/// @nodoc
abstract mixin class _$CapturedViewStateCopyWith<$Res> implements $CapturedViewStateCopyWith<$Res> {
  factory _$CapturedViewStateCopyWith(_CapturedViewState value, $Res Function(_CapturedViewState) _then) = __$CapturedViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<Pokemon> pokemons, PokedexPalette palette
});


@override $PokedexPaletteCopyWith<$Res> get palette;

}
/// @nodoc
class __$CapturedViewStateCopyWithImpl<$Res>
    implements _$CapturedViewStateCopyWith<$Res> {
  __$CapturedViewStateCopyWithImpl(this._self, this._then);

  final _CapturedViewState _self;
  final $Res Function(_CapturedViewState) _then;

/// Create a copy of CapturedViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pokemons = null,Object? palette = null,}) {
  return _then(_CapturedViewState(
pokemons: null == pokemons ? _self._pokemons : pokemons // ignore: cast_nullable_to_non_nullable
as List<Pokemon>,palette: null == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as PokedexPalette,
  ));
}

/// Create a copy of CapturedViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokedexPaletteCopyWith<$Res> get palette {
  
  return $PokedexPaletteCopyWith<$Res>(_self.palette, (value) {
    return _then(_self.copyWith(palette: value));
  });
}
}

// dart format on
