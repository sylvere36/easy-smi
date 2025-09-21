import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../injection_container.dart';
import '../../../infrastructure/_commons/network/user_session.dart';
import '../../../infrastructure/auth/data_sources/auth_local_data_source.dart';
import '../../../infrastructure/auth/dtos/auth_response/auth_response_dto.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons_widgets/my_toast.dart';

@RoutePage()
class AuthWebViewPage extends StatefulWidget {
  static const routeName = '/auth-webview';
  const AuthWebViewPage({super.key, required this.initialUrl});
  final String initialUrl;

  @override
  State<AuthWebViewPage> createState() => _AuthWebViewPageState();
}

class _AuthWebViewPageState extends State<AuthWebViewPage> {
  late final WebViewController _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => setState(() => _loading = false),
          onNavigationRequest: (request) {
            final uri = Uri.parse(request.url);
            // Intercept callback: if contains accessToken (query or fragment), store and finish
            final qpToken =
                uri.queryParameters['accessToken'] ??
                uri.queryParameters['access_token'];
            String? fragToken;
            if (qpToken == null) {
              final frag = uri.fragment; // e.g. accessToken=...&...
              if (frag.isNotEmpty) {
                final parts = frag.split('&');
                for (final p in parts) {
                  final kv = p.split('=');
                  if (kv.length == 2 &&
                      (kv[0] == 'accessToken' || kv[0] == 'access_token')) {
                    fragToken = Uri.decodeComponent(kv[1]);
                    break;
                  }
                }
              }
            }
            final accessToken = qpToken ?? fragToken;
            if (accessToken != null && accessToken.isNotEmpty) {
              _handleToken(accessToken);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  Future<void> _handleToken(String token) async {
    final session = UserSession();
    await session.init(null);
    final existing = await session.getUserDto();
    final newDto = AuthResponseDto(user: existing?.user, token: token);
    // Persist via local DS (uses SharedPreferences), through DI
    await sl<IAuthLocalDataSource>().cacheUser(newDto);

    if (!mounted) return;
    successToast(context: context, msg: 'Connexion réussie');
    context.router.replaceAll([const HomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_loading) const LinearProgressIndicator(),
        ],
      ),
    );
  }
}
