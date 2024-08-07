import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/constants/string_const.dart';
import '../../../../shared/extensions/string_ext.dart';
import '../../features/fetch_all_buckets_and_files/states_holder/fetch_all_file_bloc/fetch_all_files_bloc.dart';
import '../../features/file_editor/states_holder/file_editor_bloc/file_editor_bloc.dart';
import '../widgets/card_file_widget.dart';

@RoutePage()
class ListOfFileFetchedFromBucketScreen extends StatefulWidget {
  final String bucketName;

  const ListOfFileFetchedFromBucketScreen({
    super.key,
    @PathParam("bucketName") required this.bucketName,
  });

  @override
  State<ListOfFileFetchedFromBucketScreen> createState() =>
      _ListOfFileFetchedFromBucketScreenState();
}

class _ListOfFileFetchedFromBucketScreenState
    extends State<ListOfFileFetchedFromBucketScreen> {
  @override
  void initState() {
    context
        .read<FetchAllFilesBloc>()
        .add(FetchTheFilesFromBucketEvent(bucketName: widget.bucketName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.bucketName.capitalizeLetter(),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 28.0.sp,
                color: ColorsApp.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            PopupMenuButton(
              splashRadius: 22.0.r,
              padding: EdgeInsets.zero,
              position: PopupMenuPosition.under,
              color: ColorsApp.bleachedCedarColor,
              icon: SizedBox(
                width: 30.0.w,
                height: 30.0.h,
                child: Icon(
                  Icons.more_vert_rounded,
                  color: ColorsApp.greyColor,
                  size: 44.0.r,
                ),
              ),
              iconSize: 50.0.r,
              itemBuilder: (context) {
                return List.generate(
                  menuVerticalForFilesList.length,
                  (indexMenu) => PopupMenuItem(
                    value: indexMenu,
                    child: Text(
                      Translator.of(context)!.translate(
                        menuVerticalForFilesList[indexMenu],
                      ),
                      style: const TextStyle(
                        color: ColorsApp.whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
              onSelected: (actionMenuIndex) {
                switch (actionMenuIndex) {
                  case 0:
                    print("ajouter un fichier");
                    break;
                }
              },
            ),
          ],
        ),
        SizedBox(
          height: 20.0.h,
        ),
        Expanded(
          child: BlocListener<FileEditorBloc, FileEditorState>(
            listener: (context, fileEditorListenerState) {
              if (fileEditorListenerState is FileEditedSuccess) {
                Fluttertoast.showToast(
                  msg: Translator.of(context)!
                      .translate(fileEditorListenerState.message),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  backgroundColor: ColorsApp.tunaColor,
                  textColor: Colors.white,
                  fontSize: 16.0,
                ).whenComplete(() => context.read<FetchAllFilesBloc>().add(
                    FetchTheFilesFromBucketEvent(
                        bucketName: widget.bucketName)));
              }

              if (fileEditorListenerState is FileEditedFailed) {
                Fluttertoast.showToast(
                  msg: Translator.of(context)!
                      .translate(fileEditorListenerState.message),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  backgroundColor: ColorsApp.tunaColor,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
            child: BlocBuilder<FetchAllFilesBloc, FetchAllFilesState>(
              builder: (context, fetchAllFilesBuilderState) {
                if (fetchAllFilesBuilderState is FilesFoundWithEmpty) {
                  return Center(
                    child: Text(
                      Translator.of(context)!
                          .translate(fetchAllFilesBuilderState.message),
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
                if (fetchAllFilesBuilderState is FilesFoundWithFailed) {
                  return Center(
                    child: Flex(
                      mainAxisSize: MainAxisSize.min,
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          Translator.of(context)!
                              .translate(fetchAllFilesBuilderState.message),
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
                              context.read<FetchAllFilesBloc>().add(
                                  FetchTheFilesFromBucketEvent(
                                      bucketName: widget.bucketName));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Translator.of(context)!
                                    .translate(Lang.retryText),
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
                if (fetchAllFilesBuilderState is FilesFoundWithSuccess) {
                  return RefreshIndicator.adaptive(
                    onRefresh: () async {
                      context.read<FetchAllFilesBloc>().add(
                          FetchTheFilesFromBucketEvent(
                              bucketName: widget.bucketName));
                    },
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                      ),
                      itemCount: fetchAllFilesBuilderState.allFiles.length,
                      itemBuilder: (BuildContext context, int fileIndex) {
                        var _fileData =
                            fetchAllFilesBuilderState.allFiles[fileIndex];

                        return CardFileWidget(
                          fileName: _fileData.name,
                          fileSize: _fileData.size,
                          fileType: _fileData.fileType,
                          totalFiles: _fileData.totalFiles,
                        );
                      },
                    ),
                  );
                }
                return fetchAllFilesBuilderState is FetchAllFilesLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: ColorsApp.spearmintColor),
                      )
                    : Container();
              },
            ),
          ),
        )
      ],
    );
  }
}
