part of '../artist_search_screen.dart';

class ArtistSearchInputField extends StatefulWidget {
  @visibleForTesting
  const ArtistSearchInputField({Key? key}) : super(key: key);

  @override
  State<ArtistSearchInputField> createState() => _ArtistSearchInputFieldState();
}

class _ArtistSearchInputFieldState extends State<ArtistSearchInputField> {
  bool _showClearIconButton = false;
  late final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onSubmitted: _onSubmitted,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.search,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.zero,
        hintText: context.l10n.searchArtist,
        prefixIcon: const Icon(Icons.search),
        constraints: const BoxConstraints.tightFor(height: 36),
        suffixIcon: _showClearIconButton
            ? GestureDetector(
                onTap: _controller.clear,
                child: const Icon(Icons.clear),
              )
            : null,
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
    _controller.addListener(_onTextChanged);
  }

  void _onSubmitted(String text) {
    final searchCubit = context.read<ArtistSearchCubit>();
    searchCubit.onTextChanged(text);
    searchCubit.search();
  }

  void _onTextChanged() {
    final text = _controller.text;
    context.read<ArtistSearchCubit>().onTextChanged(text);
    if (_showClearIconButton != text.isNotEmpty) {
      _showClearIconButton = text.isNotEmpty;
      setState(() {});
    }
  }
}
