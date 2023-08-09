import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/utils/constants/colors_const.dart' as color;
import 'package:sia_host_mobile/src/utils/helpers/language_helpers/language_translation_helper.dart';
import 'package:sia_host_mobile/src/views/widgets/host_widgets/card_my_host_info_widget.dart';
import 'package:sia_host_mobile/src/views/widgets/host_widgets/card_speed_widget.dart';

class MyHostFragment extends StatefulWidget {
  const MyHostFragment({super.key});

  @override
  State<MyHostFragment> createState() => _MyHostFragmentState();
}

class _MyHostFragmentState extends State<MyHostFragment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              LanguageTranslationHelper.of(context)!.translate("my_host_text"),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 28.0.sp,
                color: color.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.73.r,
                      children: <Widget>[
                        Container(
                          height: 251.0.h,
                          decoration: BoxDecoration(
                            color: color.tunaColor,
                            borderRadius: BorderRadius.circular(12.0.r),
                          ),
                          padding: EdgeInsets.all(15.0.r),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: color.spearmintColor,
                                  width: 3.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.only(
                              left: 10.0,
                            ),
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  LanguageTranslationHelper.of(context)!
                                      .translate("server_host_text"),
                                  style: TextStyle(
                                    fontFamily: "Manrope",
                                    fontSize: 12.0.sp,
                                    color: color.cottonSeedColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.0.h,
                                ),
                                Text(
                                  '356',
                                  style: TextStyle(
                                    fontFamily: "Manrope",
                                    fontSize: 24.0.sp,
                                    color: color.whiteColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            const CardMyHostInfoWidget(
                              title: "max_download_text",
                              value: "356",
                              padding: EdgeInsets.only(left: 10.0),
                            ),
                            SizedBox(
                              height: 15.0.h,
                            ),
                            const CardMyHostInfoWidget(
                              title: "max_upload_text",
                              value: "356",
                              padding: EdgeInsets.only(left: 10.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: const <Widget>[
                        CardSpeedWidget(
                          title: "speed_down_text",
                          value: 9,
                        ),
                        CardSpeedWidget(
                          title: "upload_speed_text",
                          value: 5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.62.r,
                      children: const <Widget>[
                        CardMyHostInfoWidget(
                          title: "max_storage_text",
                          value: "356",
                          padding: EdgeInsets.only(left: 10.0),
                        ),
                        CardMyHostInfoWidget(
                          title: "max_contract_text",
                          value: "356",
                          padding: EdgeInsets.only(left: 10.0),
                        ),
                        CardMyHostInfoWidget(
                          title: "min_account_text",
                          value: "356",
                          padding: EdgeInsets.only(left: 10.0),
                        ),
                        CardMyHostInfoWidget(
                          title: "max_rpc_text",
                          value: "356",
                          padding: EdgeInsets.only(left: 10.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
