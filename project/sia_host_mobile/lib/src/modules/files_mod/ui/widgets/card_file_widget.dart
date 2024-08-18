import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:popover/popover.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/extensions/string_ext.dart';
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

class CardFileWidget extends StatefulWidget {
  final String bucketName;
  final String fileName;
  final int fileSize;
  final String fileType;
  final int totalFiles;
  const CardFileWidget({
    super.key,
    required this.bucketName,
    required this.fileName,
    required this.fileSize,
    required this.fileType,
    required this.totalFiles,
  });

  @override
  State<CardFileWidget> createState() => _CardFileWidgetState();
}

class _CardFileWidgetState extends State<CardFileWidget> {
  late TextEditingController _bucketNameDestController;
  late TextEditingController _newFileNameController;
  late TextEditingController _fileRenameController;

  @override
  void initState() {
    super.initState();
    _bucketNameDestController = TextEditingController();
    _newFileNameController = TextEditingController();
    _fileRenameController = TextEditingController();
  }

  // OverlayEntry? _overlayEntry;

  // void _showMenu(BuildContext context, Offset position) {
  //   _overlayEntry = _createOverlayEntry(
  //     context,
  //     position,
  //   );
  //   Overlay.of(context).insert(_overlayEntry!);
  // }

  // void _hideMenu() {
  //   _overlayEntry?.remove();
  //   _overlayEntry = null;
  // }

  void _showQuestionDialogBox({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return QuestionDialogBoxWidget(
          title: Lang.wantDeleteFileOrNotText,
          listBuilderItems: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CardSuggestionWidget(
                title: Translator.of(context)!.translate(Lang.yesText),
                onTap: () {
                  context.router
                      .maybePop()
                      .whenComplete(() => context.read<FileEditorBloc>().add(
                            UserDeleteTheFileEvent(
                                bucketName: widget.bucketName,
                                fileName: widget.fileType == "folder"
                                    ? widget.fileName.replaceFirst('/', '')
                                    : widget.fileName.replaceAll('/', '')),
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
        );
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
          height: 260.0.h,
          children: <Widget>[
            FieldsOfFileCopyWidget(
              bucketNameDestController: _bucketNameDestController,
              newFileNameController: _newFileNameController,
            ),
            SizedBox(
              height: 15.0.h,
            ),
            SizedBox(
              width: 85.0.w,
              height: 50.0.h,
              child: Material(
                color: ColorsApp.bleachedCedarColor,
                elevation: 2,
                borderRadius: BorderRadius.circular(8.0.r),
                child: InkWell(
                  onTap: () {
                    if (_bucketNameDestController.text.isEmpty ||
                        _newFileNameController.text.isEmpty) {
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
                      context.router.maybePop().whenComplete(
                        () {
                          context.read<FileEditorBloc>().add(
                                UserCopyAndPasteTheFileEvent(
                                  copyFileInfoEntity: CopyFileInfoEntity(
                                    sourceBucketName: widget.bucketName,
                                    sourcefileName: widget.fileType == "folder"
                                        ? widget.fileName.replaceFirst('/', '')
                                        : widget.fileName.replaceAll('/', ''),
                                    destBucketName:
                                        _bucketNameDestController.text,
                                    destfileName: widget.fileType == "folder"
                                        ? '${_newFileNameController.text}/'
                                        : "${_newFileNameController.text}${widget.fileName.getExtFile()}",
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
          height: 190.0.h,
          children: <Widget>[
            FieldsOfFileRenameWidget(
              fileRenameController: _fileRenameController,
            ),
            SizedBox(
              height: 15.0.h,
            ),
            SizedBox(
              width: 85.0.w,
              height: 50.0.h,
              child: Material(
                color: ColorsApp.bleachedCedarColor,
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
                      context.router.maybePop().whenComplete(
                        () {
                          context.read<FileEditorBloc>().add(
                                UserRenameAFileEvent(
                                  renameFileInfoEntity: RenameFileInfoEntity(
                                    bucketName: widget.bucketName,
                                    oldFileName: widget.fileType == "folder"
                                        ? widget.fileName.replaceFirst('/', '')
                                        : widget.fileName.replaceAll('/', ''),
                                    newFileName: widget.fileType == "folder"
                                        ? '${_fileRenameController.text}/'
                                        : "${_fileRenameController.text}${widget.fileName.getExtFile()}",
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
            SizedBox(
              height: 15.0.h,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          width: 300.0.w,
          height: 150.0.h,
          children: <Widget>[
            BlocBuilder<ViewTheFileDetailsBloc, ViewTheFileDetailsState>(
              bloc: context.read<ViewTheFileDetailsBloc>()
                ..add(
                  UserViewTheFileDetailsEvent(
                    bucketName: widget.bucketName,
                    fileName: widget.fileType == "folder"
                        ? widget.fileName.replaceFirst('/', '')
                        : widget.fileName.replaceAll('/', ''),
                  ),
                ),
              builder: (context, viewTheFileContentBuilderState) {
                if (viewTheFileContentBuilderState is FileDetailsSuccess) {
                  return FieldsOfFileDetailsWidget(
                    fileName: viewTheFileContentBuilderState
                        .fileDetailsEntity.fileName
                        .replaceAll('/', ''),
                    fileSize: CalculatorHelper.getFileSize(
                        viewTheFileContentBuilderState
                            .fileDetailsEntity.fileSize,
                        2),
                    createdAt: viewTheFileContentBuilderState
                        .fileDetailsEntity.modTime
                        .timeConverter(),
                  );
                }
                // if (viewTheFileContentBuilderState is FileDetailsFailed) {
                //   print("FAILED");
                // }
                // todo : je reviendrai ici

                return Container();
              },
            )
          ],
        );
      },
    );
  }

  // OverlayEntry _createOverlayEntry(
  //   BuildContext context,
  //   Offset position,
  // ) {
  //   return OverlayEntry(
  //     builder: (context) => Positioned(
  //       left: position.dx,
  //       top: position.dy - 65,
  //       child: Material(
  //         color: ColorsApp.transparentColor,
  //         child: Container(
  //           color: ColorsApp.whiteColor,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Visibility(
  //                 visible: widget.fileType != "folder",
  //                 child: TextButton(
  //                   style: ButtonStyle(
  //                     overlayColor:
  //                         WidgetStateProperty.all(ColorsApp.transparentColor),
  //                   ),
  //                   onPressed: () {
  //                     if (widget.fileType != "folder") {
  //                       context.read<FileEditorBloc>().add(
  //                           UserDownloadTheFileEvent(
  //                               fileName: widget.fileName.replaceAll('/', ''),
  //                               bucketName: widget.bucketName));
  //                     }

  //                     _hideMenu();
  //                   },
  //                   child: Text(
  //                       Translator.of(context)!
  //                           .translate(Lang.downloadFileText),
  //                       style: const TextStyle(
  //                         color: ColorsApp.bleachedCedarColor,
  //                         fontWeight: FontWeight.w400,
  //                       )),
  //                 ),
  //               ),
  //               Visibility(
  //                 visible: widget.fileType != "folder",
  //                 child: TextButton(
  //                   style: ButtonStyle(
  //                     overlayColor:
  //                         WidgetStateProperty.all(ColorsApp.transparentColor),
  //                   ),
  //                   onPressed: () {
  //                     if (widget.fileType != "folder") {
  //                       _showFileDetailsDialogBox(context: context);
  //                     }

  //                     _hideMenu();
  //                   },
  //                   child: Text(
  //                       Translator.of(context)!
  //                           .translate(Lang.viewDetailFileText),
  //                       style: const TextStyle(
  //                         color: ColorsApp.bleachedCedarColor,
  //                         fontWeight: FontWeight.w400,
  //                       )),
  //                 ),
  //               ),
  //               TextButton(
  //                 style: ButtonStyle(
  //                   overlayColor:
  //                       WidgetStateProperty.all(ColorsApp.transparentColor),
  //                 ),
  //                 onPressed: () {
  //                   _showRenameFileDialogBox(context: context);
  //                   _hideMenu();
  //                 },
  //                 child: Text(
  //                     Translator.of(context)!.translate(Lang.renameFileText),
  //                     style: const TextStyle(
  //                       color: ColorsApp.bleachedCedarColor,
  //                       fontWeight: FontWeight.w400,
  //                     )),
  //               ),
  //               TextButton(
  //                 style: ButtonStyle(
  //                   overlayColor: WidgetStateProperty.all(Colors.transparent),
  //                 ),
  //                 onPressed: () {
  //                   _showFileCopyDialogBox(context: context);
  //                   _hideMenu();
  //                 },
  //                 child: Text(
  //                   Translator.of(context)!
  //                       .translate(Lang.copyAndPasteFileText),
  //                   style: const TextStyle(
  //                     color: ColorsApp.bleachedCedarColor,
  //                     fontWeight: FontWeight.w400,
  //                   ),
  //                 ),
  //               ),
  //               TextButton(
  //                 style: ButtonStyle(
  //                   overlayColor: WidgetStateProperty.all(Colors.transparent),
  //                 ),
  //                 onPressed: () {
  //                   _showQuestionDialogBox(context: context);
  //                   _hideMenu();
  //                 },
  //                 child: Text(
  //                     Translator.of(context)!.translate(Lang.deleteFileText),
  //                     style: const TextStyle(
  //                       color: ColorsApp.bleachedCedarColor,
  //                       fontWeight: FontWeight.w400,
  //                     )),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GestureDetector(
        child: Image.asset(
          widget.fileName.hasFileOrFolderTypeByExtension(),
          width: 80.w,
          height: 80.h,
        ),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => Container(
              color: ColorsApp.whiteColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Visibility(
                    visible: widget.fileType != "folder",
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.all(ColorsApp.transparentColor),
                      ),
                      onPressed: () {
                        if (widget.fileType != "folder") {
                          context.read<FileEditorBloc>().add(
                              UserDownloadTheFileEvent(
                                  fileName: widget.fileName.replaceAll('/', ''),
                                  bucketName: widget.bucketName));
                        }
                      },
                      child: Text(
                          Translator.of(context)!
                              .translate(Lang.downloadFileText),
                          style: const TextStyle(
                            color: ColorsApp.bleachedCedarColor,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                  Visibility(
                    visible: widget.fileType != "folder",
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.all(ColorsApp.transparentColor),
                      ),
                      onPressed: () {
                        if (widget.fileType != "folder") {
                          _showFileDetailsDialogBox(context: context);
                        }
                      },
                      child: Text(
                          Translator.of(context)!
                              .translate(Lang.viewDetailFileText),
                          style: const TextStyle(
                            color: ColorsApp.bleachedCedarColor,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          WidgetStateProperty.all(ColorsApp.transparentColor),
                    ),
                    onPressed: () {
                      _showRenameFileDialogBox(context: context);
                    },
                    child: Text(
                        Translator.of(context)!.translate(Lang.renameFileText),
                        style: const TextStyle(
                          color: ColorsApp.bleachedCedarColor,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      _showFileCopyDialogBox(context: context);
                    },
                    child: Text(
                      Translator.of(context)!
                          .translate(Lang.copyAndPasteFileText),
                      style: const TextStyle(
                        color: ColorsApp.bleachedCedarColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      _showQuestionDialogBox(context: context);
                    },
                    child: Text(
                      Translator.of(context)!.translate(Lang.deleteFileText),
                      style: const TextStyle(
                        color: ColorsApp.bleachedCedarColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
            direction: PopoverDirection.bottom,
            width: 200,
          );
        },
      ),
      title: Text(
        "${widget.fileType == "folder" ? "${widget.totalFiles.toString()} ${Translator.of(context)!.translate(Lang.filesText)}\n" : ""}${CalculatorHelper.getFileSize(widget.fileSize, 2)}",
        style: TextStyle(
          fontFamily: "Manrope",
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          color: ColorsApp.cottonSeedColor,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        widget.fileName.replaceAll('/', '').capitalizeLetter(),
        style: TextStyle(
          fontFamily: "Manrope",
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
          color: ColorsApp.whiteColor,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  void dispose() {
    _bucketNameDestController.dispose();
    _newFileNameController.dispose();
    _fileRenameController.dispose();
    super.dispose();
  }
}
