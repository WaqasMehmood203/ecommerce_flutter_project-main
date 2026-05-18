import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class ACurvedEdgeWidget extends StatelessWidget {
  const ACurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ACustomCurvedEdges(),
      child: child,
    );
  }
}
