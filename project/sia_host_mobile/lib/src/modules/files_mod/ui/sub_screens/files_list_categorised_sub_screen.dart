// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sia_host_mobile/src/core/configs/language_config/translator.dart';
// import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_files_from_bucket/states_holder/files_bloc/files_bloc.dart';
// import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/bucket_tab_widget.dart';
// import 'package:sia_host_mobile/src/modules/files_mod/ui/widgets/files_dynamic_widget.dart';
// import 'package:sia_host_mobile/src/shared/constants/colors_const.dart';
// import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';
// import 'package:sia_host_mobile/src/shared/constants/string_const.dart';

// @RoutePage()
// class FilesListCategorisedScreen extends StatefulWidget {
//   const FilesListCategorisedScreen({super.key});

//   @override
//   State<FilesListCategorisedScreen> createState() =>
//       _FilesListCategorisedScreenState();
// }

// class _FilesListCategorisedScreenState
//     extends State<FilesListCategorisedScreen> {
//   late int _selectedPage;

//   @override
//   void initState() {
//     _selectedPage = 0;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FilesBloc, FilesState>(
//       builder: (context, filesBuilderState) {
//         if (filesBuilderState is BucketSelected) {
//           _selectedPage = filesBuilderState.bucketIndexSelected;
//         }
//         return Flex(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           direction: Axis.vertical,
//           children: <Widget>[
//             // Align(
//             //   alignment: Alignment.topLeft,
//             //   child: Text(
//             //     Translator.of(context)!.translate(Lang.bucketsFileText),
//             //     style: TextStyle(
//             //       fontFamily: "Manrope",
//             //       fontSize: 28.0.sp,
//             //       color: ColorsApp.whiteColor,
//             //       fontWeight: FontWeight.w700,
//             //     ),
//             //   ),
//             // ),
//             Text(
//               Translator.of(context)!.translate(Lang.bucketsFileText),
//               style: TextStyle(
//                 fontFamily: "Manrope",
//                 fontSize: 28.0.sp,
//                 color: ColorsApp.whiteColor,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             // SizedBox(
//             //   height: 20.0.h,
//             // ),

//             SizedBox(
//               height: 150.0.h,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: bucketsListItems.length,
//                 itemBuilder: (BuildContext context, int tabIndex) {
//                   var _bucket = bucketsListItems[tabIndex];
//                   return BucketTabWidget(
//                     image: _bucket["image"],
//                     totalFiles: (_bucket["files"] as List<dynamic>).length,
//                     label: _bucket["label"],
//                     onPressed: () {
//                       BlocProvider.of<FilesBloc>(context).add(
//                           SelectTheBucketIndexEvent(bucketIndex: tabIndex));
//                     },
//                     pageIsSelected: _selectedPage == tabIndex,
//                   );
//                 },
//               ),
//             ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: List.generate(bucketsListItems.length, (tabIndex) {
//             //     var _bucket = bucketsListItems[tabIndex];
//             //     return BucketTabWidget(
//             //       image: _bucket["image"],
//             //       totalFiles: 17,
//             //       label: _bucket["label"],
//             //       onPressed: () {
//             //         BlocProvider.of<FilesBloc>(context).add(
//             //             SelectTheBucketIndexEvent(bucketIndex: tabIndex));
//             //       },
//             //       pageIsSelected: _selectedPage == tabIndex,
//             //     );
//             //   }),
//             // ),

//             //* ici il faut pageview

//             FilesDynamicWidget(
//               bucketName: bucketsListItems[_selectedPage]["label"],
//             )
//           ],
//         );
//       },
//     );
//   }
// }
