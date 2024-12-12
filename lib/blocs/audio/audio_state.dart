import 'package:equatable/equatable.dart';

class AudioState extends Equatable {
  final bool isPlaying;
  final Duration currentPosition;
  final Duration totalDuration;
  final List<double> waveData;
  final double dragPosition;

  const AudioState({
    this.isPlaying = false,
    this.currentPosition = Duration.zero,
    this.totalDuration = Duration.zero,
    this.waveData = const [],
    this.dragPosition = 0.0,
  });

  AudioState copyWith({
    bool? isPlaying,
    Duration? currentPosition,
    Duration? totalDuration,
    List<double>? waveData,
    double? dragPosition,
  }) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentPosition: currentPosition ?? this.currentPosition,
      totalDuration: totalDuration ?? this.totalDuration,
      waveData: waveData ?? this.waveData,
      dragPosition: dragPosition ?? this.dragPosition,
    );
  }

  @override
  List<Object?> get props => [isPlaying, currentPosition, totalDuration, waveData, dragPosition];
}
