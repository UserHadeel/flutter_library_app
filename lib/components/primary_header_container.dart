
import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/components/curved_edges_widget.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });
final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColor.primary,
        padding: const EdgeInsets.all(0),
        child: const SizedBox(
          height: 48,
          child: Stack(
            children: [
              // Positioned(
              //     top: -150,
              //     right: -250,
              //     child: TCircularContainer(
              //       backgroundColor: Colors.white.withOpacity(0.1),
              //     )),
              // Positioned(
              //     top: 100,
              //     right: -300,
              //     child: TCircularContainer(
              //       backgroundColor: Colors.white.withOpacity(0.1),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
