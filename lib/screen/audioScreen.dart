

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/audio/audio_bloc.dart';
import '../blocs/audio/audio_event.dart';
import '../blocs/audio/audio_state.dart';
import '../widget/draggableSheet.dart';
import '../widget/ImageShowWidget.dart';
import '../widget/button/cusButton.dart';
import '../utils/appCommon.dart';
import '../utils/textStyle.dart';
import '../widget/waveBar/waveBar.dart';

class AudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AudioBloc()..add(InitializeAudio()),
      child: Scaffold(
        body: BlocBuilder<AudioBloc, AudioState>(
          builder: (context, state) {
            final bloc = context.read<AudioBloc>();
            final progress = state.totalDuration.inMilliseconds == 0
                ? 0.0
                : state.currentPosition.inMilliseconds /
                state.totalDuration.inMilliseconds;
            return Stack(
              children: [
                ImageShowWidget().imgAsset(AppImages.backgroundImg,
                    boxFit: BoxFit.fill, width: double.infinity),
                DraggableSheet(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 35, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Instant Crush",
                                style: TextStyleCommon().text_PT_S34M),
                            Text("feat. Julian Casablancas",
                                style: TextStyleCommon().text_PT_S16R),
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          bloc.add(SeekAudio(
                              details.localPosition.dx /
                                  MediaQuery.of(context).size.width));
                        },
                        child: SizedBox(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: CustomPaint(
                            painter: WaveVisualizer(
                              waveData: state.waveData,
                              progress: progress,
                              dragPosition: state.dragPosition,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                                "${state.currentPosition.inMinutes}:${(state.currentPosition.inSeconds % 60).toString().padLeft(2, '0')}",
                                style: TextStyleCommon().text_PT_S16R),
                            const SizedBox(height: 15),
                            CusButton(
                              onTap: () => bloc.add(PlayPauseAudio()),
                              isPlaying: state.isPlaying,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}



