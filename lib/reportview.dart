import 'dart:io';
import 'package:flutter/material.dart' as material;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf_creation/PdfViewerPage.dart';

reportView(context) async {
  final Document pdf = Document();
pdf.addPage(MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border:
                    BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Report',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
            Header(
                level: 0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Novel', textScaleFactor: 2),
                      PdfLogo()
                    ])),
            Header(level: 1, text: 'The Little Lady of the Big House'),
            Paragraph(
                text:
                    'A triangle love story written in an autobiographical style comprises of the key characters of a rancher, his wife and a mutual friend. Key characters are Dick Forrest, his wife Paula and Charmian. Paula and Charmian has identical problems with their personality. Both of them suffer from insomnia and they cannot bear children. '),
            Paragraph(
                text:
                    'Their lives get into to problem after Paula falls in love with Charmian and sexually attracted to him. Forrest can no more hold her and the story unravels from the couple\'s wonderful life to the extent of the suicidal death of his beloved wife.'),
            Paragraph(
                text:
                    'A triangle love story written in an autobiographical style comprises of the key characters of a rancher, his wife and a mutual friend. Key characters are Dick Forrest, his wife Paula and Charmian. Paula and Charmian has identical problems with their personality. Both of them suffer from insomnia and they cannot bear children. '),
            Paragraph(
                text:
                    'Their lives get into to problem after Paula falls in love with Charmian and sexually attracted to him. Forrest can no more hold her and the story unravels from the couple\'s wonderful life to the extent of the suicidal death of his beloved wife.'),
            Padding(padding: const EdgeInsets.all(10)),
           
          ]));
  //save PDF


final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );
}
