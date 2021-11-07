part of '../artist_search_screen.dart';

class ArtistSearchInputField extends StatefulWidget {
  @visibleForTesting
  const ArtistSearchInputField({Key? key}) : super(key: key);

  @override
  State<ArtistSearchInputField> createState() => _ArtistSearchInputFieldState();
}

class _ArtistSearchInputFieldState extends State<ArtistSearchInputField> {
  late final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      controller: _controller,
      onChanged: _onTextChanged,
      onSubmitted: _onTextChanged,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.search,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.zero,
        hintText: context.l10n.searchArtist,
        prefixIcon: const Icon(Icons.search),
        constraints: const BoxConstraints.tightFor(height: 36),
        suffixIcon: AnimatedBuilder(
          animation: _controller,
          child: GestureDetector(
            onTap: _onClearText,
            child: const Icon(Icons.clear),
          ),
          builder: (_, child) {
            return _controller.text.isNotEmpty ? child! : const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _onClearText() {
    _controller.text = '';
    _onTextChanged('');
  }

  void _onTextChanged(String text) {
    final searchCubit = context.read<ArtistSearchBloc>();
    searchCubit.add(ArtistSearchTextChanged(text));
  }
}
