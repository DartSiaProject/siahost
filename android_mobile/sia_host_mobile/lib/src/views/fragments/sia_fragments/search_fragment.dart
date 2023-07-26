import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../logic/controllers/search_bloc/search_bloc.dart';
import '../../../logic/models/host.dart';
import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../../widgets/host_widgets/card_host_widget.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  late TextEditingController _reaSearchController;
  late List<Host> _hostDataList;

  @override
  void initState() {
    super.initState();
    _reaSearchController = TextEditingController();
    _hostDataList = [];
  }

  void submitTheSearch({required String pubKey}) {
    BlocProvider.of<SearchBloc>(context)
        .add(GetHostSearchedByPubKeyEvent(pubKey: pubKey));
    _reaSearchController.clear();
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
            Padding(
              padding: EdgeInsets.only(bottom: 15.0.h),
              child: Flex(
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
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      submitTheSearch(pubKey: value);
                    },
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
            ),
            Expanded(
              child: BlocConsumer<SearchBloc, SearchState>(
                listener: (context, searchListenerState) {
                  if (searchListenerState is HostDataSearchedListEmpty) {
                    Fluttertoast.showToast(
                      msg: LanguageTranslationHelper.of(context)!
                          .translate(searchListenerState.message),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: color.tunaColor,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                builder: (context, searchBuilderState) {
                  if (searchBuilderState is HostDataListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                          color: color.spearmintColor),
                    );
                  }
                  if (searchBuilderState is HostDataListLoaded) {
                    _hostDataList = searchBuilderState.hostModelList;
                  }

                  if (searchBuilderState is HostDataListError) {
                    return Center(
                      child: Flex(
                        mainAxisSize: MainAxisSize.min,
                        direction: Axis.vertical,
                        children: <Widget>[
                          Text(
                            LanguageTranslationHelper.of(context)!
                                .translate(searchBuilderState.message),
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 20.0.sp,
                              color: color.whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          Material(
                            color: color.spearmintColor,
                            borderRadius: BorderRadius.circular(12.0.r),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.0.r),
                              onTap: () => BlocProvider.of<SearchBloc>(context)
                                  .add(GetAllHostsDataListEvent()),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  LanguageTranslationHelper.of(context)!
                                      .translate("retry_text"),
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 20.0.sp,
                                    color: color.whiteColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    color: color.spearmintColor,
                    backgroundColor: color.bleachedCedarColor,
                    onRefresh: () async {
                      BlocProvider.of<SearchBloc>(context)
                          .add(GetAllHostsDataListEvent());
                      _reaSearchController.clear();
                    },
                    child: ListView.builder(
                      itemCount: _hostDataList.length,
                      itemBuilder: (BuildContext context, int hostIndex) {
                        return CardHostWidget(
                          host: _hostDataList[hostIndex],
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _reaSearchController.clear();
  }
}
