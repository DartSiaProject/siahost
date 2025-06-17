// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/bucket_objects/bucket_object_list_cubit.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/breadcrumbs.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/cards/file_card.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/cards/folder_card.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/file_action/upload_file_widget.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_bottom_sheet.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/empty_list_widget.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@RoutePage()
class BucketDetailsPage extends StatelessWidget {
  const BucketDetailsPage({
    @PathParam('bucket') required this.bucket,
    super.key,
  });

  final String bucket;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BucketObjectListCubit(bucket)..findAll(reset: true),
      child: _BucketDetailsView(
        bucketName: bucket,
      ),
    );
  }
}

class _BucketDetailsView extends StatelessWidget {
  const _BucketDetailsView({required this.bucketName});
  final String bucketName;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async => context.read<BucketObjectListCubit>().findAll(
            reset: true,
          ),
      child: Scaffold(
        body: BlocConsumer<BucketObjectListCubit, BucketObjectListState>(
          listener: (context, state) {
            if (state.status == StateStatus.failure ||
                state.status == StateStatus.paginatingFailure) {
              AppSnackBar.error(
                message: translateErrorMessage(context, state.error!),
              );
            }
          },
          listenWhen: (previous, current) {
            return current.status == StateStatus.failure ||
                current.status == StateStatus.paginatingFailure;
          },
          builder: (context, state) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - 100) {
                  context.read<BucketObjectListCubit>().loadMore();
                }
                return false;
              },
              child: CustomScrollView(
                slivers: [
                  // appbar
                  SliverAppBar.medium(
                    title: Text(bucketName),
                    actions: [
                      IconButton(
                        icon: const Icon(CupertinoIcons.goforward),
                        onPressed: () => context
                            .read<BucketObjectListCubit>()
                            .findAll(reset: true),
                      ),
                      PopupMenuButton<int>(
                        icon: const Icon(Icons.more_vert_rounded),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 0,
                            child: Text(context.l10n.uploadFile),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 0) {
                            _onFileUpload(context);
                          }
                        },
                      ),
                    ],
                    bottom: Breadcrumbs(
                      prefix: state.prefix,
                      onTap: (prefix) {
                        context
                            .read<BucketObjectListCubit>()
                            .navigateTo(prefix);
                      },
                    ),
                  ),

                  // loader
                  if (state.status == StateStatus.loading &&
                      state.visibleObjects.isEmpty)
                    const SliverFillRemaining(
                      child: AppLoader(),
                    )

                  // error
                  else if (state.error != null && state.visibleObjects.isEmpty)
                    SliverFillRemaining(
                      child: AppErrorWidget(
                        onRefresh: () {
                          context
                              .read<BucketObjectListCubit>()
                              .findAll(reset: true);
                        },
                        message: translateErrorMessage(context, state.error!),
                      ),
                    )

                  // empty list
                  else if (state.visibleObjects.isEmpty)
                    SliverFillRemaining(
                      child: EmptyListWidget(
                        message: context.l10n.fileManagerEmpty,
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList.separated(
                        itemBuilder: (context, index) {
                          if (index == state.visibleObjects.length) {
                            return const Padding(
                              padding: EdgeInsets.all(8),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          final fileObject = state.visibleObjects[index];
                          if (fileObject.isFolder) {
                            return FolderCard(
                              onTap: () {
                                context
                                    .read<BucketObjectListCubit>()
                                    .navigateTo(fileObject.key);
                              },
                              name: fileObject.name,
                            );
                          } else {
                            return FileCard(
                              onRenamed: (newName) {
                                context
                                    .read<BucketObjectListCubit>()
                                    .updateFileObject(
                                      fileObject.copyWith(key: newName),
                                      fileObject.key,
                                    );
                              },
                              onDeleted: () {
                                context
                                    .read<BucketObjectListCubit>()
                                    .deleteFileObject(fileObject.key);
                              },
                              fileObject: fileObject,
                            );
                          }
                        },
                        itemCount: state.visibleObjects.length +
                            (state.hasMore ? 1 : 0),
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onFileUpload(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> _onFileUpload(BuildContext context) async {
    final result = await AppBottomSheet.show<bool?>(
      context,
      child: UploadFileWidget(bucketName: bucketName),
    );

    if (result ?? false) {
      unawaited(context.read<BucketObjectListCubit>().findAll(reset: true));
    }
  }
}
