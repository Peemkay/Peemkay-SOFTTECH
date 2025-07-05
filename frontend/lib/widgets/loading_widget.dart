/// Loading Widget for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/app_colors.dart';
import 'themed_logo.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  final double size;
  final Color? color;

  const LoadingWidget({super.key, this.message, this.size = 50, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const GradientLogo(size: 120, borderRadius: 20, showShadow: true)
          .animate(onPlay: (controller) => controller.repeat())
          .scale(
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
            duration: 1500.ms,
          )
          .then()
          .scale(
            begin: const Offset(1.1, 1.1),
            end: const Offset(1.0, 1.0),
            duration: 1500.ms,
          ),
    );
  }
}

// class SkeletonLoader extends StatelessWidget {
//   final double width;
//   final double height;
//   final BorderRadius? borderRadius;

//   const SkeletonLoader({
//     super.key,
//     required this.width,
//     required this.height,
//     this.borderRadius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color: AppColors.borderLight,
//             borderRadius: borderRadius ?? BorderRadius.circular(4),
//           ),
//         )
//         .animate(onPlay: (controller) => controller.repeat())
//         .shimmer(duration: 1500.ms, color: Colors.white.withOpacity(0.5));
//   }
// }

// class ContentLoader extends StatelessWidget {
//   final Widget child;
//   final bool isLoading;
//   final String? loadingMessage;

//   const ContentLoader({
//     super.key,
//     required this.child,
//     required this.isLoading,
//     this.loadingMessage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 300),
//       child: isLoading
//           ? LoadingWidget(message: loadingMessage ?? 'Loading...', size: 40)
//           : child,
//     );
//   }
// }

// class PageLoader extends StatelessWidget {
//   final bool isLoading;
//   final Widget child;
//   final String? loadingMessage;

//   const PageLoader({
//     super.key,
//     required this.isLoading,
//     required this.child,
//     this.loadingMessage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child,
//         if (isLoading)
//           Container(
//             color: AppColors.backgroundLight.withOpacity(0.8),
//             child: LoadingWidget(
//               message: loadingMessage ?? 'Loading...',
//               size: 60,
//             ),
//           ),
//       ],
//     );
//   }
// }

// class CardSkeleton extends StatelessWidget {
//   final double? width;
//   final double? height;

//   const CardSkeleton({super.key, this.width, this.height});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height ?? 200,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.cardLight,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: AppColors.borderLight),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SkeletonLoader(
//             width: double.infinity,
//             height: 20,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           const SizedBox(height: 12),
//           SkeletonLoader(
//             width: double.infinity,
//             height: 16,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           const SizedBox(height: 8),
//           SkeletonLoader(
//             width: 150,
//             height: 16,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           const Spacer(),
//           Row(
//             children: [
//               SkeletonLoader(
//                 width: 80,
//                 height: 32,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               const Spacer(),
//               SkeletonLoader(
//                 width: 24,
//                 height: 24,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ListSkeleton extends StatelessWidget {
//   final int itemCount;
//   final double itemHeight;

//   const ListSkeleton({super.key, this.itemCount = 5, this.itemHeight = 80});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//         itemCount,
//         (index) => Container(
//           margin: const EdgeInsets.only(bottom: 16),
//           child: Row(
//             children: [
//               SkeletonLoader(
//                 width: 60,
//                 height: 60,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SkeletonLoader(
//                       width: double.infinity,
//                       height: 16,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     const SizedBox(height: 8),
//                     SkeletonLoader(
//                       width: 200,
//                       height: 14,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
