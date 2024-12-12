import 'package:audioapp/screen/audioScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/audio/audio_bloc.dart';
import 'blocs/audio/audio_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Audio App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AudioBloc()..add(InitializeAudio()),
        child:  AudioScreen(),
      ),
    );
  }
}
