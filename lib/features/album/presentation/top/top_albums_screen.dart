import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../album.dart';

part 'widgets/empty_top_albums_widget.dart';
part 'widgets/top_album_error_widget.dart';
part 'widgets/top_album_list_tile.dart';
part 'widgets/top_albums_list_view.dart';

/// Shows top albums of an artist.
class TopAlbumsScreen extends StatelessWidget {
  final String artistName;

  const TopAlbumsScreen({Key? key, required this.artistName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<AlbumsCubit>()..loadTopAlbumsByArtistName(artistName),
      child: Scaffold(
        appBar: AppBar(title: Text(artistName)),
        body: BlocBuilder<AlbumsCubit, AlbumsState>(
          builder: (_, state) {
            if (state is TopAlbumsSuccess) {
              return TopAlbumsListView(albums: state.albums);
            } else if (state is TopAlbumsFailure) {
              return TopAlbumsErrorWidget(
                error: state.error,
                artistName: artistName,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
