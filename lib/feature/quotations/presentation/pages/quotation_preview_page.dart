import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../../data/models/quotation_model.dart';
import '../../utils/pdf_generator.dart';

class QuotationPreviewPage extends StatelessWidget {
  final QuotationModel quotation;

  const QuotationPreviewPage({super.key, required this.quotation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotation Preview'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PdfPreview(
        build: (format) async {
          final doc = await PdfGenerator.generateModernQuotation(quotation);
          return doc.save();
        },
        allowPrinting: true,
        allowSharing: true,
        canChangeOrientation: false,
        canChangePageFormat: false,
      ),
    );
  }
}
