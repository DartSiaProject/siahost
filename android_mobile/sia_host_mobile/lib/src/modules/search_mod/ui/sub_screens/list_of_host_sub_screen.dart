import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart' as lang;

import '../../../../core/configs/language_config/translator.dart';
import '../../features/fetch_the_hosts_data/domain/entities/card_of_host_entity.dart';
import '../../features/fetch_the_hosts_data/states_holder/fetch_all_hosts_data_bloc/fetch_all_hosts_data_bloc.dart';
import '../widgets/card_widgets/card_host_widget.dart';

@RoutePage()
class ListOfHostScreen extends StatefulWidget {
  const ListOfHostScreen({super.key});

  @override
  State<ListOfHostScreen> createState() => _ListOfHostScreenState();
}

class _ListOfHostScreenState extends State<ListOfHostScreen> {
  late TextEditingController _reaSearchController;
  late List<CardOfHostEntity> _hostDataList;

  @override
  void initState() {
    super.initState();
    _reaSearchController = TextEditingController();
    _hostDataList = <CardOfHostEntity>[];
  }

  void _submitTheSearch({required String pubKey}) {
    BlocProvider.of<FetchAllHostsDataBloc>(context)
        .add(SearchHostSearchedByPubKeyEvent(pubKey: pubKey));
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
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                Translator.of(context)!.translate(lang.searchHostText),
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
            Padding(
              padding: EdgeInsets.only(bottom: 15.0.h),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      Translator.of(context)!.translate(lang.siaHostText),
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0.sp,
                        color: color.whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      _submitTheSearch(pubKey: value);
                    },
                    controller: _reaSearchController,
                    decoration: InputDecoration(
                      hintText:
                          Translator.of(context)!.translate(lang.hostKeyText),
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
              child:
                  BlocConsumer<FetchAllHostsDataBloc, FetchAllHostsDataState>(
                listener: (context, fetchAllHostsDataListenerState) {
                  if (fetchAllHostsDataListenerState
                      is HostDataSearchedListEmpty) {
                    Fluttertoast.showToast(
                      msg: Translator.of(context)!
                          .translate(fetchAllHostsDataListenerState.message),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: color.tunaColor,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                builder: (context, fetchAllHostsDataBuilderState) {
                  if (fetchAllHostsDataBuilderState is HostDataListLoaded) {
                    _hostDataList = fetchAllHostsDataBuilderState.hostModelList;
                  }

                  if (fetchAllHostsDataBuilderState is HostDataListError) {
                    return Center(
                      child: Flex(
                        mainAxisSize: MainAxisSize.min,
                        direction: Axis.vertical,
                        children: <Widget>[
                          Text(
                            Translator.of(context)!.translate(
                                fetchAllHostsDataBuilderState.message),
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
                              onTap: () => context
                                  .read<FetchAllHostsDataBloc>()
                                  .add(FetchAllHostsDataListEvent()),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  Translator.of(context)!
                                      .translate(lang.retryText),
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

                  return _hostDataList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: color.spearmintColor),
                        )
                      : RefreshIndicator(
                          color: color.spearmintColor,
                          backgroundColor: color.bleachedCedarColor,
                          onRefresh: () async {
                            context
                                .read<FetchAllHostsDataBloc>()
                                .add(FetchAllHostsDataListEvent());
                            _reaSearchController.clear();
                          },
                          child: ListView.builder(
                            itemCount: _hostDataList.length,
                            itemBuilder: (BuildContext context, int hostIndex) {
                              var _cardOfEntityData = _hostDataList[hostIndex];
                              return CardHostWidget(
                                host: _cardOfEntityData,
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
