import 'package:equatable/equatable.dart';

abstract class AudioEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializeAudio extends AudioEvent {}

class PlayPauseAudio extends AudioEvent {}

class UpdateCurrentPosition extends AudioEvent {
  final Duration position;
  UpdateCurrentPosition(this.position);
  @override
  List<Object?> get props => [position];
}

class UpdateTotalDuration extends AudioEvent {
  final Duration duration;
  UpdateTotalDuration(this.duration);
  @override
  List<Object?> get props => [duration];
}

class SeekAudio extends AudioEvent {
  final double relativePosition;

  SeekAudio(this.relativePosition);

  @override
  List<Object?> get props => [relativePosition];
}
