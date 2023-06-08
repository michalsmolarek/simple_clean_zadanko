import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:zadanko/domain/entities/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;
  final String url;

  const ItemPage({super.key, required this.item, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title!),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          iosHttpShouldHandleCookies: true,
          url: Uri.parse(url),
        ),
      ),
    );
  }
}
