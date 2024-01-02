// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Game {
  bool get isExited => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get stepInLevel => throw _privateConstructorUsedError;
  List<GameResult> get results => throw _privateConstructorUsedError;
  GameProblem get problem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {bool isExited,
      int level,
      int stepInLevel,
      List<GameResult> results,
      GameProblem problem});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExited = null,
    Object? level = null,
    Object? stepInLevel = null,
    Object? results = null,
    Object? problem = null,
  }) {
    return _then(_value.copyWith(
      isExited: null == isExited
          ? _value.isExited
          : isExited // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      stepInLevel: null == stepInLevel
          ? _value.stepInLevel
          : stepInLevel // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GameResult>,
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as GameProblem,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isExited,
      int level,
      int stepInLevel,
      List<GameResult> results,
      GameProblem problem});
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExited = null,
    Object? level = null,
    Object? stepInLevel = null,
    Object? results = null,
    Object? problem = null,
  }) {
    return _then(_$GameImpl(
      isExited: null == isExited
          ? _value.isExited
          : isExited // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      stepInLevel: null == stepInLevel
          ? _value.stepInLevel
          : stepInLevel // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GameResult>,
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as GameProblem,
    ));
  }
}

/// @nodoc

class _$GameImpl implements _Game {
  const _$GameImpl(
      {required this.isExited,
      required this.level,
      required this.stepInLevel,
      required final List<GameResult> results,
      required this.problem})
      : _results = results;

  @override
  final bool isExited;
  @override
  final int level;
  @override
  final int stepInLevel;
  final List<GameResult> _results;
  @override
  List<GameResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final GameProblem problem;

  @override
  String toString() {
    return 'Game(isExited: $isExited, level: $level, stepInLevel: $stepInLevel, results: $results, problem: $problem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.isExited, isExited) ||
                other.isExited == isExited) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.stepInLevel, stepInLevel) ||
                other.stepInLevel == stepInLevel) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.problem, problem) || other.problem == problem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExited, level, stepInLevel,
      const DeepCollectionEquality().hash(_results), problem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);
}

abstract class _Game implements Game {
  const factory _Game(
      {required final bool isExited,
      required final int level,
      required final int stepInLevel,
      required final List<GameResult> results,
      required final GameProblem problem}) = _$GameImpl;

  @override
  bool get isExited;
  @override
  int get level;
  @override
  int get stepInLevel;
  @override
  List<GameResult> get results;
  @override
  GameProblem get problem;
  @override
  @JsonKey(ignore: true)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
