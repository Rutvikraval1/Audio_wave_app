

import 'package:flutter/material.dart';

import '../../utils/appColors.dart';
import '../../utils/appCommon.dart';
import '../ImageShowWidget.dart';

class CusButton extends StatelessWidget {
 final bool isPlaying;
 final GestureTapCallback onTap;
  const CusButton({super.key,required this.onTap,required this.isPlaying});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryTextColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 10),
              blurRadius: 25,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.5),
          child: Padding(
            padding: !isPlaying?const EdgeInsets.only(left: 6):EdgeInsets.zero,
            child: ImageShowWidget().svgPictureAsset(isPlaying ?AppImages.pauseIcon:AppImages.playIcon,),
          ),
        ),
      ),
    );
  }
}
