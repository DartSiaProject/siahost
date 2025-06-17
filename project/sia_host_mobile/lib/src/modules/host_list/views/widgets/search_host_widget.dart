import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/host_list/logic/bloc/host_list_bloc.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_input.dart';
import 'package:sia_host_mobile/src/shared/utils/enums.dart';

class SearchHostWidget extends StatefulWidget {
  const SearchHostWidget({super.key});

  @override
  State<SearchHostWidget> createState() => _SearchHostWidgetState();
}

class _SearchHostWidgetState extends State<SearchHostWidget> {
  final _textController = SearchController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HostListBloc, HostListState>(
      builder: (context, state) {
        return AppInput(
          textInputAction: TextInputAction.search,
          controller: _textController,
          labelText: context.l10n.searchLabel,
          hintText: context.l10n.searchHint,
          prefix: _textController.text.trim().isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    context.read<HostListBloc>().add(
                          const HostListSearchedEvent(
                            publicKey: '',
                          ),
                        );
                    _textController.clear();
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
          suffix: BlocBuilder<HostListBloc, HostListState>(
            builder: (context, state) {
              if (state.status == StateStatus.searching) {
                return const CupertinoActivityIndicator(
                  color: AppTheme.primaryColor,
                );
              }

              return IconButton(
                onPressed: () {
                  context.read<HostListBloc>().add(
                        HostListSearchedEvent(
                          publicKey: _textController.text.trim(),
                        ),
                      );
                },
                icon: const Icon(
                  CupertinoIcons.search,
                  color: AppTheme.primaryColor,
                ),
              );
            },
          ),
          // onSubmitted: (value) {
          //   context.read<HostListBloc>().add(
          //         HostListSearchedEvent(publicKey: _textController.text.trim()),
          //       );
          // },
        );
      },
    );
  }
}
