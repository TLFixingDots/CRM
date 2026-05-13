import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import '../data/models/quotation_model.dart';

class PdfGenerator {
  static Future<pw.Document> generateModernQuotation(QuotationModel quotation) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) {
          return [
            _buildHeader(quotation),
            pw.SizedBox(height: 20),
            _buildCustomerInfo(quotation),
            pw.SizedBox(height: 30),
            _buildItemsTable(quotation),
            pw.SizedBox(height: 20),
            _buildTotals(quotation),
            pw.SizedBox(height: 30),
            _buildFooter(quotation),
          ];
        },
      ),
    );

    return pdf;
  }

  static pw.Widget _buildHeader(QuotationModel quotation) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'QUOTATION',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue800,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text('Ref: #${quotation.id}'),
            pw.Text('Date: ${DateFormat('dd MMM yyyy').format(quotation.date)}'),
            pw.Text('Valid Until: ${DateFormat('dd MMM yyyy').format(quotation.validUntil)}'),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('YOUR COMPANY NAME', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16)),
            pw.Text('123 Business Road'),
            pw.Text('City, Country 12345'),
            pw.Text('contact@yourcompany.com'),
          ],
        ),
      ],
    );
  }

  static pw.Widget _buildCustomerInfo(QuotationModel quotation) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: const pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Prepared For:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 4),
              pw.Text(quotation.customerName, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              pw.Text(quotation.contactPerson),
            ],
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text(quotation.email),
              pw.Text(quotation.phone),
              if (quotation.address.isNotEmpty) pw.Text(quotation.address),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildItemsTable(QuotationModel quotation) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$');

    return pw.TableHelper.fromTextArray(
      headers: ['Description', 'Qty', 'Unit Price', 'Tax (%)', 'Disc', 'Total'],
      data: quotation.items.map((item) {
        final total = (item.quantity * item.unitPrice) - item.discount;
        return [
          item.name,
          item.quantity.toString(),
          currencyFormatter.format(item.unitPrice),
          '${item.taxRate}%',
          currencyFormatter.format(item.discount),
          currencyFormatter.format(total),
        ];
      }).toList(),
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.white),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.blue800),
      rowDecoration: const pw.BoxDecoration(border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey300))),
      cellAlignment: pw.Alignment.centerRight,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
      },
    );
  }

  static pw.Widget _buildTotals(QuotationModel quotation) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$');

    return pw.Container(
      alignment: pw.Alignment.centerRight,
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Spacer(flex: 6),
          pw.Expanded(
            flex: 4,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildTotalRow('Subtotal:', currencyFormatter.format(quotation.subtotal)),
                if (quotation.totalDiscount > 0)
                  _buildTotalRow('Discount:', '-${currencyFormatter.format(quotation.totalDiscount)}'),
                _buildTotalRow('Tax:', currencyFormatter.format(quotation.totalTax)),
                pw.Divider(color: PdfColors.grey400),
                _buildTotalRow(
                  'Grand Total:',
                  currencyFormatter.format(quotation.grandTotal),
                  isBold: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildTotalRow(String label, String value, {bool isBold = false}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal)),
          pw.Text(value, style: pw.TextStyle(fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal)),
        ],
      ),
    );
  }

  static pw.Widget _buildFooter(QuotationModel quotation) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        if (quotation.notes.isNotEmpty) ...[
          pw.Text('Notes:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(quotation.notes),
          pw.SizedBox(height: 10),
        ],
        if (quotation.termsAndConditions.isNotEmpty) ...[
          pw.Text('Terms & Conditions:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(quotation.termsAndConditions, style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
        ],
      ],
    );
  }
}
