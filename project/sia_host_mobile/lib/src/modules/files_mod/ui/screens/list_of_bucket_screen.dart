import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/custom_login_widget.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/constants/routes_const.dart';
import '../../features/fetch_all_buckets_and_files/states_holder/fetch_all_bucket_bloc/fetch_all_bucket_bloc.dart';
import '../widgets/card_of_bucket_widget.dart';

@RoutePage()
class ListOfBucketScreen extends StatefulWidget {
  const ListOfBucketScreen({super.key});

  @override
  State<ListOfBucketScreen> createState() => _ListOfBucketScreenState();
}

class _ListOfBucketScreenState extends State<ListOfBucketScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Translator.of(context)!.translate(Lang.bucketsFileText),
          style: TextStyle(
            fontFamily: "Manrope",
            fontSize: 28.0.sp,
            color: ColorsApp.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20.0.h,
        ),
        Expanded(
          child: BlocBuilder<FetchAllBucketBloc, FetchAllBucketState>(
            builder: (context, fetchAllBucketBuilderState) {
              if (fetchAllBucketBuilderState is MakLoginToSeeTheBucket) {
                return CustomLoginWidget(onLoginSuccess: () {
                  context.read<FetchAllBucketBloc>().add(FetchBucketsEvent());
                });
              }
              if (fetchAllBucketBuilderState is AllBucketFetchedSuccess) {
                return RefreshIndicator.adaptive(
                  color: ColorsApp.spearmintColor,
                  backgroundColor: ColorsApp.bleachedCedarColor,
                  onRefresh: () async {
                    context.read<FetchAllBucketBloc>().add(FetchBucketsEvent());
                  },
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: fetchAllBucketBuilderState.allBuckets.length,
                    itemBuilder: (BuildContext context, int bucketIndex) {
                      var _bucketData =
                          fetchAllBucketBuilderState.allBuckets[bucketIndex];
                      return Padding(
                        padding: const EdgeInsets.only(left: 23.0),
                        child: CardOfBucketWidget(
                          totalFiles: _bucketData.totalFiles,
                          label: _bucketData.nameBucket,
                          onPressed: () {
                            context.router.pushNamed(
                                "${RoutePath.listOfFileFetchedFromBucketSubPath}/${_bucketData.nameBucket}");
                          },
                        ),
                      );
                    },
                  ),
                );
              }

              if (fetchAllBucketBuilderState is AllBucketFetchedEmpty) {
                return Center(
                  child: Text(
                    Translator.of(context)!
                        .translate(fetchAllBucketBuilderState.message),
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20.0.sp,
                      color: ColorsApp.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (fetchAllBucketBuilderState is AllBucketFetchedFailed) {
                return Center(
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        Translator.of(context)!
                            .translate(fetchAllBucketBuilderState.message),
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20.0.sp,
                          color: ColorsApp.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Material(
                        color: ColorsApp.spearmintColor,
                        borderRadius: BorderRadius.circular(12.0.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.0.r),
                          onTap: () {
                            context
                                .read<FetchAllBucketBloc>()
                                .add(FetchBucketsEvent());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Translator.of(context)!.translate(Lang.retryText),
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 20.0.sp,
                                color: ColorsApp.whiteColor,
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

              return fetchAllBucketBuilderState is AllBucketFetchedLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: ColorsApp.spearmintColor),
                    )
                  : Container();
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _adressController.dispose();
    // _userMailController.dispose();
    // _userPasswordController.dispose();
  }
}
