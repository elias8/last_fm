import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../features.dart';

part 'widgets/album_detail.dart';
part 'widgets/album_detail_error.dart';
part 'widgets/album_detail_progress_indicator.dart';
part 'widgets/album_more_info_button.dart';
part 'widgets/album_overview.dart';
part 'widgets/album_popup_menu_button.dart';
part 'widgets/album_tags_wrap.dart';
part 'widgets/app_bar_background.dart';
part 'widgets/track_list_tile.dart';

class AlbumDetailScreen extends StatelessWidget {
  final AlbumDetailQuery query;

  const AlbumDetailScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AlbumDetailCubit>()..loadAlbumDetail(query),
      child: ScaffoldMessenger(
        child: BlocConsumer<AlbumDetailCubit, AlbumDetailState>(
          listener: _cubitListener,
          builder: (context, state) {
            if (state is AlbumDetailLoaded) {
              return state.response.fold(
                (l) => AlbumDetailErrorWidget(error: l, query: query),
                (r) => AlbumDetailWidget(album: r),
              );
            }
            return const AlbumDetailProgressIndicator();
          },
        ),
      ),
    );
  }

  void _cubitListener(BuildContext context, AlbumDetailState state) {
    if (state is AlbumDetailDeleted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              const Icon(Icons.info, color: Colors.blue),
              const SizedBox(width: 16),
              Text(context.l10n.albumDeleteSuccessful),
            ],
          ),
        ),
      );
      Navigator.of(context).pop();
    }
  }
}
