import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:networkx/networkx.dart';

import '../../../../config/config.dart';
import '../../../features.dart';

part 'widgets/artist_list_tile.dart';
part 'widgets/artist_list_view.dart';
part 'widgets/artist_search_error.dart';
part 'widgets/artist_search_input_field.dart';
part 'widgets/artist_search_result.dart';
part 'widgets/empty_artists_widget.dart';

class ArtistSearchScreen extends StatelessWidget {
  final Widget? bottomNavigationBar;

  const ArtistSearchScreen({Key? key, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ArtistSearchBloc>(),
      child: Scaffold(
        appBar: AppBar(titleSpacing: 8, title: const ArtistSearchInputField()),
        body: const ArtistSearchResult(),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
