import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scanner_app/styles/styles.dart';

class analises extends StatelessWidget {
  final String url = "https://www.google.com.br"; // Coloque sua URL aqui

  analises({Key? key}) : super(key: key);

  // Função para lançar o URL
  void _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Não foi possível abrir a URL.';
    }
  }

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
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text('Abrir URL'),
        ),
      ),
    );
  }
}
