import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scanner_app/screens/updateClientes.dart';
import 'package:scanner_app/styles/styles.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter/webview_flutter.dart';

class analises extends StatelessWidget {
  analises({Key? key}) : super(key: key);

  // Insira o link do seu dashboard do PowerBI
  final String powerBiDashboardUrl =
      'https://app.powerbi.com/reportEmbed?reportId=45a96a0a-c923-4f57-8009-a272037b0baf&autoAuth=true&ctid=a71efe12-218d-4803-95bd-4c896ba7ce66';

  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(
        'https://app.powerbi.com/reportEmbed?reportId=45a96a0a-c923-4f57-8009-a272037b0baf&autoAuth=true&ctid=a71efe12-218d-4803-95bd-4c896ba7ce66')); // Altere aqui

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StylesProntos.colorPadrao,
        title: Text(
          "Análise",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(
          controller: controller), // Exibe o WebView com o Power BI
    );
  }
}
