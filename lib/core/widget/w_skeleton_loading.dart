import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum SkeletonState { success, loading, error }

class WSkeletonLoading extends StatelessWidget {
  const WSkeletonLoading({
    super.key,
    required this.loadingState,
    required this.loadingWidget,
    required this.successWidget,
    this.errorWidget = const Center(child: _ErrorLoading()),
  });
  final SkeletonState loadingState;
  final Widget loadingWidget;
  final Widget errorWidget;
  final Widget successWidget;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 30),
      reverseDuration: Duration(milliseconds: 30),
      child: _renderWidget(),
    );
  }

  Widget _renderWidget() {
    switch (loadingState) {
      case SkeletonState.success:
        return successWidget;
      case SkeletonState.loading:
        return Shimmer.fromColors(
          baseColor: Colors.grey.withValues(alpha: 0.01),
          highlightColor: Colors.grey.withValues(alpha: 0.3),
          child: loadingWidget,
        );
      case SkeletonState.error:
        return errorWidget;
    }
  }
}

class _ErrorLoading extends StatelessWidget {
  const _ErrorLoading();

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      widthFactor: 0.25,
      child: AspectRatio(
        aspectRatio: 1,
        child: Icon(Icons.error_outline, color: Colors.red),
      ),
    );
  }
}
