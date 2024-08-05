import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';

class BucketTabWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final String label;
  final int totalFiles;
  final bool pageIsSelected;

  const BucketTabWidget({
    super.key,
    required this.image,
    required this.totalFiles,
    required this.label,
    required this.onPressed,
    this.pageIsSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Image.asset(
            image,
            width: pageIsSelected ? 160.w : 120.w,
            height: pageIsSelected ? 140.h : 105.h,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: pageIsSelected ? 30.0 : 22.0, bottom: 20.0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$totalFiles ${Translator.of(context)!.translate(Lang.filesText)}",
                  style: TextStyle(
                    color: ColorsApp.whiteColor.withOpacity(0.7),
                    fontSize: pageIsSelected ? 12.0.sp : 9.0.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: ColorsApp.whiteColor,
                    fontSize: pageIsSelected ? 20.0.sp : 13.0.sp,
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: pageIsSelected ? null : onPressed,
    );

    // Container(
    //   width: 65.0.w,
    //   height: 65.0.h,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10.0),
    //     border: Border.all(
    //       color: pageIsSelected ? selectedColor : unSelectedIndicatorColor,
    //     ),
    //   ),
    //   child: Material(
    //     color: alabasterColor,
    //     borderRadius: BorderRadius.circular(10.0),
    //     child: InkWell(
    //       splashFactory: NoSplash.splashFactory,
    //       borderRadius: BorderRadius.circular(10.0),
    //       onTap: pageIsSelected ? null : onPressed,
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Flex(
    //           direction: Axis.vertical,
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             image!,
    //             Flexible(
    //               child: Text(
    //                 label!,
    //                 style: TextStyle(
    //                   fontSize: 12.0.sp,
    //                   color: pageIsSelected
    //                       ? selectedLabelColor
    //                       : unSelectedLabelColor,
    //                   fontWeight: FontWeight.w500,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
