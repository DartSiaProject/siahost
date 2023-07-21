import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/utils/helpers/language_helpers/language_translation_helper.dart';

import '../../../utils/constants/colors_const.dart' as color;

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  late TextEditingController _reaSearchController;

  @override
  void initState() {
    super.initState();
    _reaSearchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              LanguageTranslationHelper.of(context)!
                  .translate("search_host_text"),
              style: TextStyle(
                fontFamily: "DmSans",
                fontSize: 28.0.sp,
                color: color.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    LanguageTranslationHelper.of(context)!
                        .translate("sia_host_text"),
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16.0.sp,
                      color: color.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: _reaSearchController,
                  decoration: InputDecoration(
                    hintText: LanguageTranslationHelper.of(context)!
                        .translate("host_key_text"),
                  ),
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: color.ironsideGreyColor,
                    fontSize: 16.0.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
