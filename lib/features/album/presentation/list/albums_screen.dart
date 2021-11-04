import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../../shared/shared.dart';
import '../../album.dart';

part 'widgets/album_widget.dart';
part 'widgets/albums_grid_view.dart';
part 'widgets/albums_popup_menu_button.dart';
part 'widgets/albums_widget.dart';
part 'widgets/empty_albums_widget.dart';

class AlbumsScreen extends StatelessWidget {
  final Widget? bottomNavigationBar;

  const AlbumsScreen({Key? key, this.bottomNavigationBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AlbumsCubit>()..watchAllAlbums(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 120,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              SvgAssets.logoText,
              color: Colors.white,
            ),
          ),
          actions: const [AlbumsPopupMenuButton()],
        ),
        body: const AlbumsWidget(),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
