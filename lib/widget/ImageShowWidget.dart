
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageShowWidget {
  SvgPicture svgPictureAsset(String imagePath,
      {double? height, double? width, Color? colorCode}) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
      color: colorCode,
    );
  }
  Image imgAsset(String imagePath,
      {double? height,
      double? width,
      Color? colorCode,
        BoxFit? boxFit,
      BlendMode? blendMode}) {
    return Image.asset(
      imagePath,
      height: height,
      width: width,
      color: colorCode,
      colorBlendMode: blendMode,
      fit: boxFit,
    );
  }
}
