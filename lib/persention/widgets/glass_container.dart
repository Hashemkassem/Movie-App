// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  // late double borderCircular;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  const GlassContainer(
      {Key? key,
      required this.child,
      this.width,
      this.height,
      this.margin,
      // this.borderCircular,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child:
          //blur effect ==> the third layer of stack
          //GlowContainer
          Container(
        //glowColor: Colors.white.withOpacity(0.2),
        width: width,
        height: height,
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            //sigmaX is the Horizontal blur
            sigmaX: 4.0,
            //sigmaY is the Vertical blur
            sigmaY: 4.0,
          ),
          //we use this container to scale up the blur effect to fit its
          //  parent, without this container the blur effect doesn't appear.
          child: Container(
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.13)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    //begin color
                    Colors.white.withOpacity(0.15),
                    //end color
                    Colors.white.withOpacity(0.05),
                  ]),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
