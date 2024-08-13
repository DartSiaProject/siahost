// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sia_host_mobile/src/modules/files_mod/features/view_a_file_details/states_holder/view_the_file_content_bloc/view_the_file_details_bloc.dart';
// import 'package:sia_host_mobile/src/shared/constants/colors_const.dart';
// import 'package:sia_host_mobile/src/shared/extensions/string_ext.dart';

// @RoutePage()
// class PreviewTheFileContentScreen extends StatefulWidget {
//   final String fileName;

//   const PreviewTheFileContentScreen(
//       {super.key, @PathParam("fileName") required this.fileName});

//   @override
//   State<PreviewTheFileContentScreen> createState() =>
//       _PreviewTheFileContentScreenState();
// }

// class _PreviewTheFileContentScreenState
//     extends State<PreviewTheFileContentScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context
//         .read<ViewTheFileDetailsBloc>()
//         .add(UserViewTheFileDetailsEvent(fileName: "/${widget.fileName}"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           widget.fileName.capitalizeLetter(),
//           style: TextStyle(
//             fontFamily: "Manrope",
//             fontSize: 28.0.sp,
//             color: ColorsApp.whiteColor,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         SizedBox(
//           height: 20.0.h,
//         ),
//         BlocBuilder<ViewTheFileDetailsBloc, ViewTheFileDetailsState>(
//           builder: (context, viewTheFileContentBuilderState) {
//             if (viewTheFileContentBuilderState is FileDetailsSuccess) {
//               print("GOOD");
//             }
//             if (viewTheFileContentBuilderState is FileDetailsFailed) {
//               print("FAILED");
//             }

//             return viewTheFileContentBuilderState is FileDetailsLoading
//                 ? const Center(
//                     child: CircularProgressIndicator(
//                       color: ColorsApp.spearmintColor,
//                     ),
//                   )
//                 : Container();
//           },
//         )
//       ],
//     );
//   }
// }
