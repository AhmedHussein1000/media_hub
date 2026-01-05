// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoState()';
}


}

/// @nodoc
class $VideoStateCopyWith<$Res>  {
$VideoStateCopyWith(VideoState _, $Res Function(VideoState) __);
}


/// Adds pattern-matching-related methods to [VideoState].
extension VideoStatePatterns on VideoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _VideoInitial value)?  initial,TResult Function( VideoLoading value)?  loading,TResult Function( VideoLoaded value)?  loaded,TResult Function( VideoError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoInitial() when initial != null:
return initial(_that);case VideoLoading() when loading != null:
return loading(_that);case VideoLoaded() when loaded != null:
return loaded(_that);case VideoError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _VideoInitial value)  initial,required TResult Function( VideoLoading value)  loading,required TResult Function( VideoLoaded value)  loaded,required TResult Function( VideoError value)  error,}){
final _that = this;
switch (_that) {
case _VideoInitial():
return initial(_that);case VideoLoading():
return loading(_that);case VideoLoaded():
return loaded(_that);case VideoError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _VideoInitial value)?  initial,TResult? Function( VideoLoading value)?  loading,TResult? Function( VideoLoaded value)?  loaded,TResult? Function( VideoError value)?  error,}){
final _that = this;
switch (_that) {
case _VideoInitial() when initial != null:
return initial(_that);case VideoLoading() when loading != null:
return loading(_that);case VideoLoaded() when loaded != null:
return loaded(_that);case VideoError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( BetterPlayerController controller,  int currentIndex,  List<File> playlist,  Duration position,  Duration duration,  bool isPlaying,  bool isShuffling,  bool isLooping,  bool isInitialized)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoInitial() when initial != null:
return initial();case VideoLoading() when loading != null:
return loading();case VideoLoaded() when loaded != null:
return loaded(_that.controller,_that.currentIndex,_that.playlist,_that.position,_that.duration,_that.isPlaying,_that.isShuffling,_that.isLooping,_that.isInitialized);case VideoError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( BetterPlayerController controller,  int currentIndex,  List<File> playlist,  Duration position,  Duration duration,  bool isPlaying,  bool isShuffling,  bool isLooping,  bool isInitialized)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _VideoInitial():
return initial();case VideoLoading():
return loading();case VideoLoaded():
return loaded(_that.controller,_that.currentIndex,_that.playlist,_that.position,_that.duration,_that.isPlaying,_that.isShuffling,_that.isLooping,_that.isInitialized);case VideoError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( BetterPlayerController controller,  int currentIndex,  List<File> playlist,  Duration position,  Duration duration,  bool isPlaying,  bool isShuffling,  bool isLooping,  bool isInitialized)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _VideoInitial() when initial != null:
return initial();case VideoLoading() when loading != null:
return loading();case VideoLoaded() when loaded != null:
return loaded(_that.controller,_that.currentIndex,_that.playlist,_that.position,_that.duration,_that.isPlaying,_that.isShuffling,_that.isLooping,_that.isInitialized);case VideoError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _VideoInitial implements VideoState {
  const _VideoInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoState.initial()';
}


}




/// @nodoc


class VideoLoading implements VideoState {
  const VideoLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoState.loading()';
}


}




/// @nodoc


class VideoLoaded implements VideoState {
  const VideoLoaded({required this.controller, this.currentIndex = 0, final  List<File> playlist = const [], this.position = Duration.zero, this.duration = Duration.zero, this.isPlaying = false, this.isShuffling = false, this.isLooping = false, this.isInitialized = false}): _playlist = playlist;
  

 final  BetterPlayerController controller;
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
@JsonKey() final  bool isShuffling;
@JsonKey() final  bool isLooping;
@JsonKey() final  bool isInitialized;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoLoadedCopyWith<VideoLoaded> get copyWith => _$VideoLoadedCopyWithImpl<VideoLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoLoaded&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other._playlist, _playlist)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isShuffling, isShuffling) || other.isShuffling == isShuffling)&&(identical(other.isLooping, isLooping) || other.isLooping == isLooping)&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized));
}


@override
int get hashCode => Object.hash(runtimeType,controller,currentIndex,const DeepCollectionEquality().hash(_playlist),position,duration,isPlaying,isShuffling,isLooping,isInitialized);

@override
String toString() {
  return 'VideoState.loaded(controller: $controller, currentIndex: $currentIndex, playlist: $playlist, position: $position, duration: $duration, isPlaying: $isPlaying, isShuffling: $isShuffling, isLooping: $isLooping, isInitialized: $isInitialized)';
}


}

/// @nodoc
abstract mixin class $VideoLoadedCopyWith<$Res> implements $VideoStateCopyWith<$Res> {
  factory $VideoLoadedCopyWith(VideoLoaded value, $Res Function(VideoLoaded) _then) = _$VideoLoadedCopyWithImpl;
@useResult
$Res call({
 BetterPlayerController controller, int currentIndex, List<File> playlist, Duration position, Duration duration, bool isPlaying, bool isShuffling, bool isLooping, bool isInitialized
});




}
/// @nodoc
class _$VideoLoadedCopyWithImpl<$Res>
    implements $VideoLoadedCopyWith<$Res> {
  _$VideoLoadedCopyWithImpl(this._self, this._then);

  final VideoLoaded _self;
  final $Res Function(VideoLoaded) _then;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? controller = null,Object? currentIndex = null,Object? playlist = null,Object? position = null,Object? duration = null,Object? isPlaying = null,Object? isShuffling = null,Object? isLooping = null,Object? isInitialized = null,}) {
  return _then(VideoLoaded(
controller: null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as BetterPlayerController,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,playlist: null == playlist ? _self._playlist : playlist // ignore: cast_nullable_to_non_nullable
as List<File>,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isShuffling: null == isShuffling ? _self.isShuffling : isShuffling // ignore: cast_nullable_to_non_nullable
as bool,isLooping: null == isLooping ? _self.isLooping : isLooping // ignore: cast_nullable_to_non_nullable
as bool,isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class VideoError implements VideoState {
  const VideoError({required this.error});
  

 final  String error;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoErrorCopyWith<VideoError> get copyWith => _$VideoErrorCopyWithImpl<VideoError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'VideoState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $VideoErrorCopyWith<$Res> implements $VideoStateCopyWith<$Res> {
  factory $VideoErrorCopyWith(VideoError value, $Res Function(VideoError) _then) = _$VideoErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$VideoErrorCopyWithImpl<$Res>
    implements $VideoErrorCopyWith<$Res> {
  _$VideoErrorCopyWithImpl(this._self, this._then);

  final VideoError _self;
  final $Res Function(VideoError) _then;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(VideoError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
