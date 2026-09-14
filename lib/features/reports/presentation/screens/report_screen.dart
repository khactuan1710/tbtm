import 'package:auto_route/auto_route.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Renders a server report/history page in a WebView, passing the auth token as
/// a Bearer header so the page loads the signed-in user's data.
@RoutePage()
class ReportScreen extends StatefulWidget {
  const ReportScreen({
    super.key,
    required this.url,
    required this.title,
    required this.token,
  });

  final String url;
  final String title;
  final String token;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late final WebViewController _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.surface)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _loading = true),
          onPageFinished: (_) => setState(() => _loading = false),
        ),
      )
      ..loadRequest(
        Uri.parse(widget.url),
        headers: widget.token.isEmpty
            ? const {}
            : {'Authorization': 'Bearer ${widget.token}'},
      );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: BaseAppBar(title: widget.title),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_loading) const Center(child: AppLoading()),
        ],
      ),
    );
  }
}
