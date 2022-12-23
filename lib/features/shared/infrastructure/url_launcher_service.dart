// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

/// A class responsible for opening web urls.
///
/// The implementation is based on the `url_launcher` package.
abstract class UrlLauncherService {
  Future<void> openUrl(String url);
}

@Injectable(as: UrlLauncherService)
class UrlLauncherServiceImpl implements UrlLauncherService {
  @override
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
