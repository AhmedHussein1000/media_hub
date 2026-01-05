// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState()';
}


}

/// @nodoc
class $AudioStateCopyWith<$Res>  {
$AudioStateCopyWith(AudioState _, $Res Function(AudioState) __);
}


/// Adds pattern-matching-related methods to [AudioState].
extension AudioStatePatterns on AudioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AudioInitial value)?  initial,TResult Function( AudioLoading value)?  loading,TResult Function( AudioLoaded value)?  loaded,TResult Function( AudioError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioInitial() when initial != null:
return initial(_that);case AudioLoading() when loading != null:
return loading(_that);case AudioLoaded() when loaded != null:
return loaded(_that);case AudioError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AudioInitial value)  initial,required TResult Function( AudioLoading value)  loading,required TResult Function( AudioLoaded value)  loaded,required TResult Function( AudioError value)  error,}){
final _that = this;
switch (_that) {
case _AudioInitial():
return initial(_that);case AudioLoading():
return loading(_that);case AudioLoaded():
return loaded(_that);case AudioError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AudioInitial value)?  initial,TResult? Function( AudioLoading value)?  loading,TResult? Function( AudioLoaded value)?  loaded,TResult? Function( AudioError value)?  error,}){
final _that = this;
switch (_that) {
case _AudioInitial() when initial != null:
return initial(_that);case AudioLoading() when loading != null:
return loading(_that);case AudioLoaded() when loaded != null:
return loaded(_that);case AudioError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AudioPlayer player,  int currentIndex,  List<File> playlist,  Duration position,  Duration duration,  bool isPlaying,  bool isShuffle,  double speed,  LoopMode loopMode)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioInitial() when initial != null:
return initial();case AudioLoading() when loading != null:
return loading();case AudioLoaded() when loaded != null:
return loaded(_that.player,_that.currentIndex,_that.playlist,_that.position,_that.duration,_that.isPlaying,_that.isShuffle,_that.speed,_that.loopMode);case AudioError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AudioPlayer player,  int currentIndex,  List<File> playlist,  Duration position,  Duration duration,  bool isPlaying,  bool isShuffle,  double speed,  LoopMode loopMode)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _AudioInitial():
return initial();case AudioLoading():
return loading();case AudioLoaded():
return loaded(_that.player,_that.currentIndex,_that.playlist,_that.position,_that.duration,_that.isPlaying,_that.isShuffle,_that.speed,_that.loopMode);case AudioError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AudioPlayer player,  int currentIndex,  List<File> playlist,  Duration position,  Duration duration,  bool isPlaying,  bool isShuffle,  double speed,  LoopMode loopMode)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _AudioInitial() when initial != null:
return initial();case AudioLoading() when loading != null:
return loading();case AudioLoaded() when loaded != null:
return loaded(_that.player,_that.currentIndex,_that.playlist,_that.position,_that.duration,_that.isPlaying,_that.isShuffle,_that.speed,_that.loopMode);case AudioError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AudioInitial implements AudioState {
  const _AudioInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.initial()';
}


}




/// @nodoc


class AudioLoading implements AudioState {
  const AudioLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.loading()';
}


}




/// @nodoc


class AudioLoaded implements AudioState {
  const AudioLoaded({required this.player, this.currentIndex = 0, final  List<File> playlist = const [], this.position = Duration.zero, this.duration = Duration.zero, this.isPlaying = false, this.isShuffle = false, this.speed = 1.0, this.loopMode = LoopMode.off}): _playlist = playlist;
  

 final  AudioPlayer player;
@JsonKey() final  int currentIndex;
 final  List<File> _playlist;
@JsonKey() List<File> get playlist {
  if (_playlist is EqualUnmodifiableListView) return _playlist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playlist);
}

@JsonKey() final  Duration position;
@JsonKey() final  Duration duration;
@JsonKey() final  bool isPlaying;
@JsonKey() final  bool isShuffle;
@JsonKey() final  double speed;
@JsonKey() final  LoopMode loopMode;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioLoadedCopyWith<AudioLoaded> get copyWith => _$AudioLoadedCopyWithImpl<AudioLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioLoaded&&(identical(other.player, player) || other.player == player)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other._playlist, _playlist)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isShuffle, isShuffle) || other.isShuffle == isShuffle)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.loopMode, loopMode) || other.loopMode == loopMode));
}


@override
int get hashCode => Object.hash(runtimeType,player,currentIndex,const DeepCollectionEquality().hash(_playlist),position,duration,isPlaying,isShuffle,speed,loopMode);

@override
String toString() {
  return 'AudioState.loaded(player: $player, currentIndex: $currentIndex, playlist: $playlist, position: $position, duration: $duration, isPlaying: $isPlaying, isShuffle: $isShuffle, speed: $speed, loopMode: $loopMode)';
}


}

/// @nodoc
abstract mixin class $AudioLoadedCopyWith<$Res> implements $AudioStateCopyWith<$Res> {
  factory $AudioLoadedCopyWith(AudioLoaded value, $Res Function(AudioLoaded) _then) = _$AudioLoadedCopyWithImpl;
@useResult
$Res call({
 AudioPlayer player, int currentIndex, List<File> playlist, Duration position, Duration duration, bool isPlaying, bool isShuffle, double speed, LoopMode loopMode
});




}
/// @nodoc
class _$AudioLoadedCopyWithImpl<$Res>
    implements $AudioLoadedCopyWith<$Res> {
  _$AudioLoadedCopyWithImpl(this._self, this._then);

  final AudioLoaded _self;
  final $Res Function(AudioLoaded) _then;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? player = null,Object? currentIndex = null,Object? playlist = null,Object? position = null,Object? duration = null,Object? isPlaying = null,Object? isShuffle = null,Object? speed = null,Object? loopMode = null,}) {
  return _then(AudioLoaded(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as AudioPlayer,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,playlist: null == playlist ? _self._playlist : playlist // ignore: cast_nullable_to_non_nullable
as List<File>,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isShuffle: null == isShuffle ? _self.isShuffle : isShuffle // ignore: cast_nullable_to_non_nullable
as bool,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,loopMode: null == loopMode ? _self.loopMode : loopMode // ignore: cast_nullable_to_non_nullable
as LoopMode,
  ));
}


}

/// @nodoc


class AudioError implements AudioState {
  const AudioError({required this.error});
  

 final  String error;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioErrorCopyWith<AudioError> get copyWith => _$AudioErrorCopyWithImpl<AudioError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AudioState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AudioErrorCopyWith<$Res> implements $AudioStateCopyWith<$Res> {
  factory $AudioErrorCopyWith(AudioError value, $Res Function(AudioError) _then) = _$AudioErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AudioErrorCopyWithImpl<$Res>
    implements $AudioErrorCopyWith<$Res> {
  _$AudioErrorCopyWithImpl(this._self, this._then);

  final AudioError _self;
  final $Res Function(AudioError) _then;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AudioError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
