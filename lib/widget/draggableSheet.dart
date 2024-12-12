
import 'package:flutter/material.dart';

class DraggableSheet extends StatelessWidget {
  final Widget? child;
  const DraggableSheet({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1F1F1F),
                Color(0xFF313131)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.5],
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child:child
        );
      },
    );
  }
}
