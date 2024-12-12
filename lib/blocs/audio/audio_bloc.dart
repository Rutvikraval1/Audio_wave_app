import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'audio_event.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioBloc() : super(const AudioState()) {
    on<InitializeAudio>(_onInitializeAudio);
    on<PlayPauseAudio>(_onPlayPauseAudio);
    on<UpdateCurrentPosition>(_onUpdateCurrentPosition);
    on<UpdateTotalDuration>(_onUpdateTotalDuration);
    on<SeekAudio>(_onSeekAudio);

    _audioPlayer.positionStream.listen((position) {
      add(UpdateCurrentPosition(position));
    });

    _audioPlayer.durationStream.listen((duration) {
      add(UpdateTotalDuration(duration ?? Duration.zero));
    });

    _audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        add(PlayPauseAudio()); // Stops playback when completed
      }
    });
  }

  void _onInitializeAudio(InitializeAudio event, Emitter<AudioState> emit)  {
     _audioPlayer.setAsset("assets/Images/pngImg/song.mp3");
     _audioPlayer.play();

    emit(state.copyWith(
      isPlaying: true,
      waveData: List.generate(100, (_) => Random().nextDouble() * 100),
    ));
  }

  void _onPlayPauseAudio(PlayPauseAudio event, Emitter<AudioState> emit) {
    if (state.isPlaying) {
      _audioPlayer.pause();
    } else {
      if (_audioPlayer.processingState == ProcessingState.completed ||
          _audioPlayer.processingState == ProcessingState.idle) {
        _audioPlayer.setAsset("assets/Images/pngImg/song.mp3").then((_) {
          _audioPlayer.play();
        });
      } else {
        _audioPlayer.play();
      }
    }
    emit(state.copyWith(isPlaying: !state.isPlaying));
  }

  void _onSeekAudio(SeekAudio event, Emitter<AudioState> emit) {
    final newPosition = state.totalDuration * event.relativePosition;
    _audioPlayer.seek(newPosition);
  }


  void _onUpdateCurrentPosition(UpdateCurrentPosition event, Emitter<AudioState> emit) {
    emit(state.copyWith(currentPosition: event.position));
  }

  void _onUpdateTotalDuration(UpdateTotalDuration event, Emitter<AudioState> emit) {
    print("event.duration");
    print(event.duration);
    emit(state.copyWith(currentPosition: event.duration,totalDuration: event.duration));
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
