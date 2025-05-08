import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/buckets/bucket_list_cubit.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/add_bucket.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_bottom_sheet.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@RoutePage()
class FileManagerPage extends StatelessWidget {
  const FileManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: context.read<BucketListCubit>().findAll,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
              title: Text(context.l10n.filesTitle),
              floating: true,
              snap: true,
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: FileManagerView(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppBottomSheet.show<dynamic>(
            context,
            child: const AddBucketWidget(),
            isDismissible: false,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FileManagerView extends StatelessWidget {
  const FileManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BucketListCubit, BucketListState>(
      builder: (context, state) {
        final status = state.status;

        if (status == StateStatus.loading) {
          return const AppLoader();
        }

        final buckets = state.buckets;

        if (status == StateStatus.failure) {
          if (buckets.isEmpty) {
            return AppErrorWidget(
              onRefresh: () {
                context.read<BucketListCubit>().findAll();
              },
              message: translateErrorMessage(context, state.error!),
            );
          }
        }

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: buckets.length,
          itemBuilder: (BuildContext context, int index) {
            final bucket = buckets[index];
            return ListTile(
              onTap: () {
                context.pushRoute(BucketDetailsRoute(bucket: bucket.name));
              },
              contentPadding: EdgeInsets.zero,
              leading: const Badge(
                alignment: Alignment.topLeft,
                label: Icon(
                  Icons.online_prediction_rounded,
                  color: Colors.white,
                ),
                backgroundColor: Colors.transparent,
                child: Icon(
                  CupertinoIcons.folder_solid,
                  color: AppTheme.primaryColor,
                  size: 50,
                ),
              ),
              title: Text(bucket.name),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 16,
          ),
        );
      },
    );
  }
}
