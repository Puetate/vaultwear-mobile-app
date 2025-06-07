import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vualtwear_mobile_app/src/utils/utils.dart';

class UrlTypeWidget extends StatefulWidget {
  final String urlContent;
  const UrlTypeWidget({super.key, required this.urlContent});

  @override
  State<UrlTypeWidget> createState() => _UrlTypeWidgetState();
}

class _UrlTypeWidgetState extends State<UrlTypeWidget> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _launchUrl();
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(widget.urlContent);

    await Future.delayed(const Duration(milliseconds: 300)); // Pequeño delay para mostrar el loader

    final success = await launchUrl(url, mode: LaunchMode.inAppWebView);
    if (!success && mounted) {
      ToastManager.showErrorToast(context, "No se pudo iniciar $url");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.5),
      body: Center(
        child: _isLoading
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    "Abriendo enlace...",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            : const Text("No se pudo abrir el enlace."),
      ),
    );
  }
}
