import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sia_host_mobile/src/core/router/auto_routes.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/shared/constants/pngs_const.dart';
import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';
import 'package:sia_host_mobile/src/shared/helpers/file_manager_helper.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/constants/string_const.dart';
import '../../../../shared/extensions/string_ext.dart';
import '../../../../shared/global/list_variable.dart';
import '../../../../shared/helpers/calculator_helper.dart';
import '../../../../shared/ui/widgets/card_suggestion_widget.dart';
import '../../../../shared/ui/widgets/form_dialog_box_widget.dart';
import '../../../../shared/ui/widgets/question_dialog_box_widget.dart';
import '../../features/file_editor/domain/entities/copy_file_info_entity.dart';
import '../../features/file_editor/domain/entities/rename_file_info_entity.dart';
import '../../features/file_editor/states_holder/file_editor_bloc/file_editor_bloc.dart';
import '../../features/view_a_file_details/states_holder/view_the_file_content_bloc/view_the_file_details_bloc.dart';
import 'fields_of_file_copy_widget.dart';
import 'fields_of_file_details_widget.dart';
import 'fields_of_file_rename_widget.dart';
import 'fields_of_folder_details_widget.dart';

class CardFileWidget extends StatefulWidget {
  final String bucketName;
  // final String fileName;
  // final int fileSize;
  // final String fileType;
  // final int totalFiles;
  final FileEntity file;

  const CardFileWidget({
    super.key,
    required this.bucketName,
    // required this.fileName,
    // required this.fileSize,
    // required this.fileType,
    // required this.totalFiles,
    required this.file,
  });

  @override
  State<CardFileWidget> createState() => _CardFileWidgetState();
}

class _CardFileWidgetState extends State<CardFileWidget> {
  late TextEditingController _newFileNameController;
  late TextEditingController _fileRenameController;
  late String _selectedBucketName;
  late FileEntity _file;

  @override
  void initState() {
    super.initState();
    _file = widget.file;

    _newFileNameController = TextEditingController();
    _fileRenameController = TextEditingController(
        text: _file.name.replaceAll("/", "").capitalizeLetter());
    _selectedBucketName = bucketNameList.first;
  }

  void _showDeleteQuestionDialogBox({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return QuestionDialogBoxWidget(
            title: Lang.wantDeleteFileOrNotText,
            builderItems: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CardSuggestionWidget(
                    title: Translator.of(context)!.translate(Lang.yesText),
                    onTap: () {
                      context.router.maybePop().whenComplete(
                          () => context.read<FileEditorBloc>().add(
                                UserDeleteTheFileEvent(
                                    bucketName: widget.bucketName,
                                    fileName: _file.fileType == "folder"
                                        ? _file.name.replaceFirst('/', '')
                                        : _file.name.replaceAll('/', '')),
                              ));
                    },
                  ),
                  CardSuggestionWidget(
                    title: Translator.of(context)!.translate(Lang.noText),
                    onTap: () {
                      context.router.maybePop();
                    },
                  )
                ],
              ),
            ));
      },
    );
  }

  void _showFileCopyDialogBox({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return FormDialogBoxWidget(
          title: Lang.fileCopierText,
          crossAxisAlignment: CrossAxisAlignment.end,
          width: 300.0.w,
          height: 215.0.h,
          children: <Widget>[
            FieldsOfFileCopyWidget(
              newFileNameController: _newFileNameController,
              bucketNameSelected: (String bucketNameSelected) {
                _selectedBucketName = bucketNameSelected;
                print(_selectedBucketName);
              },
            ),
            SizedBox(
              width: 85.0.w,
              height: 45.0.h,
              child: Material(
                color: ColorsApp.spearmintColor,
                elevation: 2,
                borderRadius: BorderRadius.circular(8.0.r),
                child: InkWell(
                  onTap: () {
                    if (_newFileNameController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: Translator.of(context)!
                            .translate(Lang.fillFieldsText),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: ColorsApp.tunaColor,
                        textColor: Colors.white,
                        fontSize: 16.0.sp,
                      );
                    } else {
                      context.router.maybePop().whenComplete(
                        () {
                          context.read<FileEditorBloc>().add(
                                UserCopyAndPasteTheFileEvent(
                                  copyFileInfoEntity: CopyFileInfoEntity(
                                    sourceBucketName: widget.bucketName,
                                    sourcefileName: _file.fileType == "folder"
                                        ? _file.name.replaceFirst('/', '')
                                        : _file.name.replaceAll('/', ''),
                                    destBucketName: _selectedBucketName,
                                    destfileName: _file.fileType == "folder"
                                        ? '${_newFileNameController.text}/'
                                        : "${_newFileNameController.text}${_file.name.getExtFile()}",
                                  ),
                                ),
                              );
                        },
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Center(
                      child: Text(
                        Translator.of(context)!.translate(Lang.submitText),
                        style: TextStyle(
                          color: ColorsApp.whiteColor,
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0.h,
            ),
          ],
        );
      },
    );
  }

  void _showRenameFileDialogBox({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return FormDialogBoxWidget(
          title: Lang.renameFileText,
          crossAxisAlignment: CrossAxisAlignment.end,
          width: 300.0.w,
          height: 160.0.h,
          children: <Widget>[
            FieldsOfFileRenameWidget(
              fileRenameController: _fileRenameController,
            ),
            SizedBox(
              width: 85.0.w,
              height: 45.0.h,
              child: Material(
                color: ColorsApp.spearmintColor,
                elevation: 2,
                borderRadius: BorderRadius.circular(8.0.r),
                child: InkWell(
                  onTap: () {
                    if (_fileRenameController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: Translator.of(context)!
                            .translate(Lang.fillFieldsText),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: ColorsApp.tunaColor,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else {
                      if (_fileRenameController.text !=
                          _file.name.replaceAll('/', '')) {
                        context.router.maybePop().whenComplete(
                          () {
                            context.read<FileEditorBloc>().add(
                                  UserRenameAFileEvent(
                                    renameFileInfoEntity: RenameFileInfoEntity(
                                        bucketName: widget.bucketName,
                                        oldFileName: _file.fileType == "folder"
                                            ? _file.name.replaceFirst('/', '')
                                            : _file.name.replaceAll('/', ''),
                                        newFileName: _file.fileType == "folder"
                                            ? '${_fileRenameController.text}/'
                                            : _fileRenameController.text
                                        // "${_fileRenameController.text}${widget.fileName.getExtFile()}",
                                        ),
                                  ),
                                );
                          },
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Center(
                      child: Text(
                        Translator.of(context)!.translate(Lang.renameText),
                        style: TextStyle(
                          color: ColorsApp.whiteColor,
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showFileDetailsDialogBox({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return FormDialogBoxWidget(
          title: Lang.viewDetailFileText,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          width: 300.0.w,
          height: 140.0.h,
          children: <Widget>[
            BlocBuilder<ViewTheFileDetailsBloc, ViewTheFileDetailsState>(
              bloc: context.read<ViewTheFileDetailsBloc>()
                ..add(
                  UserViewTheFileDetailsEvent(
                    bucketName: widget.bucketName,
                    fileName: _file.name.replaceAll('/', ''),
                  ),
                ),
              builder: (context, viewTheFileContentBuilderState) {
                if (viewTheFileContentBuilderState is FileDetailsSuccess) {
                  return FieldsOfFileDetailsWidget(
                    fileName: viewTheFileContentBuilderState
                        .fileDetailsEntity.fileName
                        .replaceAll('/', '')
                        .capitalizeLetter(),
                    fileSize: CalculatorHelper.getFileSize(
                        viewTheFileContentBuilderState
                            .fileDetailsEntity.fileSize,
                        2),
                    createdAt: viewTheFileContentBuilderState
                        .fileDetailsEntity.modTime
                        .timeConverter(),
                  );
                }

                return viewTheFileContentBuilderState is FileDetailsLoading
                    ? Padding(
                        padding: EdgeInsets.only(top: 45.0.h),
                        child: const Center(
                          child: CircularProgressIndicator(
                              color: ColorsApp.spearmintColor),
                        ),
                      )
                    : Container();
              },
            )
          ],
        );
      },
    );
  }

  void _showFolderDetailsDialogBox({
    required BuildContext context,
    required String folderName,
    required String folderSize,
    required String totalFiles,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return FormDialogBoxWidget(
          title: Lang.viewDetailFolderText,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          width: 300.0.w,
          height: 140.0.h,
          children: <Widget>[
            FieldsOfFolderDetailsWidget(
              folderName: folderName,
              folderSize: folderSize,
              totalsFile: totalFiles,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: PopupMenuButton(
        splashRadius: 22.0.r,
        padding: _file.fileType == "folder"
            ? const EdgeInsets.only(left: 4, bottom: 6)
            : const EdgeInsets.only(left: 8, bottom: 18),
        position: PopupMenuPosition.under,
        icon: Image.asset(
          _file.fileType == "folder"
              ? Pngs.folderPng
              : FileManagerHelper.thumbnail(_file.typeEnum),
          width: 50.w,
          height: 50.h,
        ),
        itemBuilder: (context) {
          return List.generate(
            menuFilesList.length,
            (indexMenu) => PopupMenuItem(
              value: indexMenu,
              child: Text(
                Translator.of(context)!.translate(
                  menuFilesList[indexMenu],
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
        onSelected: (actionMenuIndex) {
          switch (actionMenuIndex) {
            case 0:
              if (_file.fileType != "folder") {
                context.read<FileEditorBloc>().add(
                      UserDownloadTheFileEvent(
                        fileName: _file.name.replaceAll('/', ''),
                        bucketName: widget.bucketName,
                      ),
                    );
                print(_file);
              } else {
                context.pushRoute(
                  ListOfFileFetchedFromBucketRoute(
                    bucketName: widget.bucketName + _file.name,
                  ),
                );
              }

              break;
            case 1:
              if (_file.fileType != "folder") {
                _showFileDetailsDialogBox(context: context);
              } else {
                _showFolderDetailsDialogBox(
                  context: context,
                  folderName: _file.name.replaceAll('/', '').capitalizeLetter(),
                  folderSize: CalculatorHelper.getFileSize(_file.size, 2),
                  totalFiles: _file.totalFiles.toString(),
                );
              }
              break;
            case 2:
              _showRenameFileDialogBox(context: context);
              break;
            case 3:
              _showFileCopyDialogBox(context: context);
              break;
            case 4:
              _showDeleteQuestionDialogBox(context: context);
              break;
          }
        },
      ),
      title: Text(
        _file.name.replaceAll('/', '').capitalizeLetter(),
        style: TextStyle(
          fontFamily: "Manrope",
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
          color: ColorsApp.whiteColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        _file.fileType == "folder"
            ? "${_file.totalFiles.toString()} ${Translator.of(context)!.translate(Lang.filesText)} | ${CalculatorHelper.getFileSize(_file.size, 2)}"
            : CalculatorHelper.getFileSize(_file.size, 2),
        style: TextStyle(
          fontFamily: "Manrope",
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          color: ColorsApp.cottonSeedColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  void dispose() {
    _newFileNameController.dispose();
    _fileRenameController.dispose();
    super.dispose();
  }
}
