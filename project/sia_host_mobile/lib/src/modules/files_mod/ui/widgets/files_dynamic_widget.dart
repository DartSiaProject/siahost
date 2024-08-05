// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sia_host_mobile/src/core/configs/language_config/translator.dart';
// import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_files_from_bucket/states_holder/fetch_all_file_bloc/fetch_all_files_bloc.dart';
// import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/card_file_widget.dart';
// import 'package:sia_host_mobile/src/shared/constants/colors_const.dart';
// import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';

// class FilesDynamicWidget extends StatelessWidget {
//   final String bucketName;

//   const FilesDynamicWidget({
//     super.key,
//     required this.bucketName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchAllFilesBloc, FetchAllFilesState>(
//       bloc: context.read<FetchAllFilesBloc>()
//         ..add(FetchTheFilesFromBucketEvent(bucketName: bucketName)),
//       builder: (context, fetchAllFilesBuilderState) {
//         if (fetchAllFilesBuilderState is FilesFoundWithSuccess) {
//           return Expanded(
//             child: RefreshIndicator.adaptive(
//               onRefresh: () async {
//                 context
//                     .read<FetchAllFilesBloc>()
//                     .add(FetchTheFilesFromBucketEvent(bucketName: bucketName));
//               },
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 2,
//                   mainAxisSpacing: 1,
//                   crossAxisSpacing: 1,
//                 ),
//                 itemCount: fetchAllFilesBuilderState.allFiles.length,
//                 itemBuilder: (BuildContext context, int fileIndex) {
//                   var _fileData = fetchAllFilesBuilderState.allFiles[fileIndex];

//                   return CardFileWidget(
//                     fileName: _fileData.name,
//                     fileSize: _fileData.size,
//                     fileType: _fileData.fileType,
//                     totalFiles: _fileData.totalFiles,
//                   );
//                 },
//               ),
//             ),
//           );
//         }

//         if (fetchAllFilesBuilderState is FilesFoundWithEmpty) {
//           return Center(
//             child: Text(
//               Translator.of(context)!
//                   .translate(fetchAllFilesBuilderState.message),
//               style: TextStyle(
//                 fontFamily: "Roboto",
//                 fontSize: 20.0.sp,
//                 color: ColorsApp.whiteColor,
//                 fontWeight: FontWeight.w600,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           );
//         }
//         if (fetchAllFilesBuilderState is FilesFoundWithFailed) {
//           return Center(
//             child: Flex(
//               mainAxisSize: MainAxisSize.min,
//               direction: Axis.vertical,
//               children: <Widget>[
//                 Text(
//                   Translator.of(context)!
//                       .translate(fetchAllFilesBuilderState.message),
//                   style: TextStyle(
//                     fontFamily: "Roboto",
//                     fontSize: 20.0.sp,
//                     color: ColorsApp.whiteColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 10.0.h,
//                 ),
//                 Material(
//                   color: ColorsApp.spearmintColor,
//                   borderRadius: BorderRadius.circular(12.0.r),
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(12.0.r),
//                     onTap: () {
//                       context.read<FetchAllFilesBloc>().add(
//                           FetchTheFilesFromBucketEvent(bucketName: bucketName));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         Translator.of(context)!.translate(Lang.retryText),
//                         style: TextStyle(
//                           fontFamily: "Roboto",
//                           fontSize: 20.0.sp,
//                           color: ColorsApp.whiteColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//         return fetchAllFilesBuilderState is FetchAllFilesLoading
//             ? const Center(
//                 child:
//                     CircularProgressIndicator(color: ColorsApp.spearmintColor),
//               )
//             : Container();
//       },
//     );
//   }
// }
