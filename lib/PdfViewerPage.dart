import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
class PdfViewerPage extends StatelessWidget {
  String path;
  PdfViewerPage({Key key, this.path}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
      
    );
  }
}