import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/extensions/string_ext.dart';
import '../../../../shared/helpers/calculator_helper.dart';
import '../../../../shared/ui/widgets/card_suggestion_widget.dart';
import '../../../../shared/ui/widgets/question_dialog_box_widget.dart';
import '../../features/file_editor/states_holder/file_editor_bloc/file_editor_bloc.dart';

class CardFileWidget extends StatefulWidget {
  final String fileName;
  final int fileSize;
  final String fileType;
  final int totalFiles;
  const CardFileWidget({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.fileType,
    required this.totalFiles,
  });

  @override
  State<CardFileWidget> createState() => _CardFileWidgetState();
}

class _CardFileWidgetState extends State<CardFileWidget> {
  OverlayEntry? _overlayEntry;

  void _showMenu(
      BuildContext context, Offset position, String fileNameWithExtension) {
    _overlayEntry =
        _createOverlayEntry(context, position, fileNameWithExtension);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

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
                                fileNameWithExtension: widget.fileType ==
                                        "folder"
                                    ? "${widget.fileName.replaceAll('/', '')}/"
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

  OverlayEntry _createOverlayEntry(
      BuildContext context, Offset position, String fileNameWithExtension) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy - 65,
        child: Material(
          color: ColorsApp.transparentColor,
          child: Container(
            color: ColorsApp.whiteColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    overlayColor:
                        WidgetStateProperty.all(ColorsApp.transparentColor),
                  ),
                  onPressed: () {
                    print('Rename The File: $fileNameWithExtension');
                    _hideMenu();
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
                    print('Copy and Paste The File: $fileNameWithExtension');
                    _hideMenu();
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
                    _hideMenu();
                  },
                  child: Text(
                      Translator.of(context)!.translate(Lang.deleteFileText),
                      style: const TextStyle(
                        color: ColorsApp.bleachedCedarColor,
                        fontWeight: FontWeight.w400,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_overlayEntry != null) {
          _hideMenu();
        }
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: GestureDetector(
          child: Image.asset(
            widget.fileName.hasFileOrFolderTypeByExtension(),
            width: 80.w,
            height: 80.h,
          ),
          onTap: () {
            if (_overlayEntry != null) {
              _hideMenu();
            }
            print("view the file");
          },
          onLongPressStart: (details) {
            _hideMenu();
            if (_overlayEntry == null) {
              _showMenu(context, details.globalPosition, widget.fileName);
            }
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
      ),
    );

    //  Flex(
    //   direction: Axis.horizontal,
    //   mainAxisSize: MainAxisSize.min,
    //   children: <Widget>[
    //     GestureDetector(
    //       onTap: () {
    //         if (_overlayEntry != null) {
    //           _hideMenu();
    //         }
    //         print("view the file");
    //       },
    //       onLongPressStart: (details) {
    //         _hideMenu();
    //         if (_overlayEntry == null) {
    //           _showMenu(context, details.globalPosition);
    //         }
    //       },
    //       child: Image.asset(
    //         widget.fileName.hasFileOrFolderTypeByExtension(),
    //         width: 75.w,
    //         height: 75.h,
    //       ),
    //     ),

    //     Flex(
    //       direction: Axis.vertical,
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         SizedBox(
    //           width: 80.0.w,
    //           child: Flex(
    //             direction: Axis.horizontal,
    //             mainAxisSize: MainAxisSize.min,
    //             children: <Widget>[
    //               Text(
    //                 "${widget.fileType == "folder" ? "${widget.totalFiles.toString()} ${Translator.of(context)!.translate(Lang.filesText)}\n | " : ""}${CalculatorHelper.getFileSize(widget.fileSize, 2)}",
    //                 style: TextStyle(
    //                   fontFamily: "Manrope",
    //                   fontSize: 12.0.sp,
    //                   fontWeight: FontWeight.w500,
    //                   color: ColorsApp.cottonSeedColor,
    //                 ),
    //                 maxLines: 2,
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //               PopupMenuButton(
    //                 splashRadius: 22.0.r,
    //                 padding: EdgeInsets.zero,
    //                 position: PopupMenuPosition.under,
    //                 color: ColorsApp.bleachedCedarColor,
    //                 icon: SizedBox(
    //                   width: 5.0.w,
    //                   height: 5.0.h,
    //                   child: Icon(
    //                     Icons.more_vert_rounded,
    //                     color: ColorsApp.greyColor,
    //                     size: 44.0.r,
    //                   ),
    //                 ),
    //                 iconSize: 50.0.r,
    //                 itemBuilder: (context) {
    //                   return List.generate(
    //                     menuVerticalForFilesList.length,
    //                     (indexMenu) => PopupMenuItem(
    //                       value: indexMenu,
    //                       child: Text(
    //                         Translator.of(context)!.translate(
    //                           menuVerticalForFilesList[indexMenu],
    //                         ),
    //                         style: const TextStyle(
    //                           color: ColorsApp.whiteColor,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //                 onSelected: (actionMenuIndex) {
    //                   switch (actionMenuIndex) {
    //                     case 0:
    //                       print("ajouter un fichier");
    //                       break;
    //                   }
    //                 },
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 5.0,
    //         ),
    //         SizedBox(
    //           width: 85.0.w,
    //           child: Text(
    //             widget.fileName.replaceAll('/', '').capitalizeLetter(),
    //             style: TextStyle(
    //               fontFamily: "Manrope",
    //               fontSize: 16.0.sp,
    //               fontWeight: FontWeight.bold,
    //               color: ColorsApp.whiteColor,
    //             ),
    //             maxLines: 2,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // );
  }
}
