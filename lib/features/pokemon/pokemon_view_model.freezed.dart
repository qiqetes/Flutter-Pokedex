// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokemonDetailState {

 Pokemon get pokemon; bool get isCaptured;
/// Create a copy of PokemonDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonDetailStateCopyWith<PokemonDetailState> get copyWith => _$PokemonDetailStateCopyWithImpl<PokemonDetailState>(this as PokemonDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonDetailState&&(identical(other.pokemon, pokemon) || other.pokemon == pokemon)&&(identical(other.isCaptured, isCaptured) || other.isCaptured == isCaptured));
}


@override
int get hashCode => Object.hash(runtimeType,pokemon,isCaptured);

@override
String toString() {
  return 'PokemonDetailState(pokemon: $pokemon, isCaptured: $isCaptured)';
}


}

/// @nodoc
abstract mixin class $PokemonDetailStateCopyWith<$Res>  {
  factory $PokemonDetailStateCopyWith(PokemonDetailState value, $Res Function(PokemonDetailState) _then) = _$PokemonDetailStateCopyWithImpl;
@useResult
$Res call({
 Pokemon pokemon, bool isCaptured
});


$PokemonCopyWith<$Res> get pokemon;

}
/// @nodoc
class _$PokemonDetailStateCopyWithImpl<$Res>
    implements $PokemonDetailStateCopyWith<$Res> {
  _$PokemonDetailStateCopyWithImpl(this._self, this._then);

  final PokemonDetailState _self;
  final $Res Function(PokemonDetailState) _then;

/// Create a copy of PokemonDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pokemon = null,Object? isCaptured = null,}) {
  return _then(_self.copyWith(
pokemon: null == pokemon ? _self.pokemon : pokemon // ignore: cast_nullable_to_non_nullable
as Pokemon,isCaptured: null == isCaptured ? _self.isCaptured : isCaptured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PokemonDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonCopyWith<$Res> get pokemon {
  
  return $PokemonCopyWith<$Res>(_self.pokemon, (value) {
    return _then(_self.copyWith(pokemon: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonDetailState].
extension PokemonDetailStatePatterns on PokemonDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonDetailState value)  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Pokemon pokemon,  bool isCaptured)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonDetailState() when $default != null:
return $default(_that.pokemon,_that.isCaptured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Pokemon pokemon,  bool isCaptured)  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailState():
return $default(_that.pokemon,_that.isCaptured);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Pokemon pokemon,  bool isCaptured)?  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailState() when $default != null:
return $default(_that.pokemon,_that.isCaptured);case _:
  return null;

}
}

}

/// @nodoc


class _PokemonDetailState implements PokemonDetailState {
  const _PokemonDetailState({required this.pokemon, required this.isCaptured});
  

@override final  Pokemon pokemon;
@override final  bool isCaptured;

/// Create a copy of PokemonDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonDetailStateCopyWith<_PokemonDetailState> get copyWith => __$PokemonDetailStateCopyWithImpl<_PokemonDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonDetailState&&(identical(other.pokemon, pokemon) || other.pokemon == pokemon)&&(identical(other.isCaptured, isCaptured) || other.isCaptured == isCaptured));
}


@override
int get hashCode => Object.hash(runtimeType,pokemon,isCaptured);

@override
String toString() {
  return 'PokemonDetailState(pokemon: $pokemon, isCaptured: $isCaptured)';
}


}

/// @nodoc
abstract mixin class _$PokemonDetailStateCopyWith<$Res> implements $PokemonDetailStateCopyWith<$Res> {
  factory _$PokemonDetailStateCopyWith(_PokemonDetailState value, $Res Function(_PokemonDetailState) _then) = __$PokemonDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Pokemon pokemon, bool isCaptured
});


@override $PokemonCopyWith<$Res> get pokemon;

}
/// @nodoc
class __$PokemonDetailStateCopyWithImpl<$Res>
    implements _$PokemonDetailStateCopyWith<$Res> {
  __$PokemonDetailStateCopyWithImpl(this._self, this._then);

  final _PokemonDetailState _self;
  final $Res Function(_PokemonDetailState) _then;

/// Create a copy of PokemonDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pokemon = null,Object? isCaptured = null,}) {
  return _then(_PokemonDetailState(
pokemon: null == pokemon ? _self.pokemon : pokemon // ignore: cast_nullable_to_non_nullable
as Pokemon,isCaptured: null == isCaptured ? _self.isCaptured : isCaptured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PokemonDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonCopyWith<$Res> get pokemon {
  
  return $PokemonCopyWith<$Res>(_self.pokemon, (value) {
    return _then(_self.copyWith(pokemon: value));
  });
}
}

// dart format on
