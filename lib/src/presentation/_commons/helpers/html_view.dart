import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlView extends StatefulWidget {
  final String html;
  const HtmlView({super.key, required this.html});

  @override
  State<HtmlView> createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..loadHtmlString(_wrapHtml(widget.html));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _controller,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
      },
    );
  }

  String _wrapHtml(String content) {
    const String head = '''
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
      <style>
        html, body {
          margin: 0; padding: 0;
          font-size: 14px; line-height: 1.5; color: #222;
          width: 100%;
          overflow-x: hidden; /* prevent horizontal scroll */
          -webkit-text-size-adjust: 100%; /* prevent auto text zoom */
          text-size-adjust: 100%;
        }
        /* Ensure all elements wrap and don't overflow */
        * {
          box-sizing: border-box;
          max-width: 100%;
          word-wrap: break-word;
          overflow-wrap: anywhere;
          white-space: normal;
        }
        img, video, iframe {
          max-width: 100% !important;
          width: 100% !important;
          height: auto;
        }
        table {
          width: 100% !important;
          border-collapse: collapse;
          table-layout: fixed; /* make long words wrap inside cells */
        }
        td, th {
          word-break: break-word;
        }
        pre, code, samp, kbd {
          white-space: pre-wrap; /* wrap long code lines */
          word-break: break-word;
        }
        a { word-break: break-all; }
        h1 { font-size: 18px; }
        h2 { font-size: 16px; }
        h3 { font-size: 15px; }
      </style>
    ''';
    return '<!DOCTYPE html><html><head>$head</head><body>$content</body></html>';
  }
}
