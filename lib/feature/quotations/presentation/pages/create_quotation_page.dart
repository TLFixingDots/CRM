import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/custom_app_bar.dart';
import '../../../../utils/custom_widgets/custom_text_field.dart';
import '../../data/models/quotation_model.dart';
import 'quotation_preview_page.dart';

class CreateQuotationPage extends ConsumerStatefulWidget {
  const CreateQuotationPage({super.key});

  @override
  ConsumerState<CreateQuotationPage> createState() => _CreateQuotationPageState();
}

class _CreateQuotationPageState extends ConsumerState<CreateQuotationPage> {
  final _formKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  final List<QuotationItem> _items = [];

  void _addItem() {
    setState(() {
      _items.add(
        QuotationItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: 'New Item',
          description: '',
          quantity: 1,
          unitPrice: 0,
          taxRate: 0,
          discount: 0,
        ),
      );
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _generatePreview() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_items.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please add at least one item')),
        );
        return;
      }

      final quotation = QuotationModel(
        id: 'QO-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
        leadId: 'dummy-lead-id',
        customerName: _customerNameController.text,
        contactPerson: _contactPersonController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        date: DateTime.now(),
        validUntil: DateTime.now().add(const Duration(days: 30)),
        items: _items,
        notes: 'Thank you for your business!',
        termsAndConditions: '1. Payment is due within 30 days.\n2. Goods remain property until paid.',
      );

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => QuotationPreviewPage(quotation: quotation),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.mainGradient),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Create Quotation',
                  subtitle: 'Convert lead to quotation',
                  horizontalPadding: 16,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildCustomerSection(),
                      const SizedBox(height: 20),
                      _buildItemsSection(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: _generatePreview,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Preview PDF', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerSection() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Customer Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Customer Name',
              hint: 'Company / Name',
              controller: _customerNameController,
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'Contact Person',
              hint: 'Contact Person',
              controller: _contactPersonController,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'Email',
              hint: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'Phone',
              hint: 'Phone',
              controller: _phoneController,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'Address',
              hint: 'Address',
              controller: _addressController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsSection() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Line Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextButton.icon(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Item'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...List.generate(_items.length, (index) {
              final item = _items[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item #${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                          onPressed: () => _removeItem(index),
                        ),
                      ],
                    ),
                    TextFormField(
                      initialValue: item.name,
                      decoration: const InputDecoration(labelText: 'Item Name'),
                      onChanged: (v) => _items[index] = item.copyWith(name: v),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: item.quantity.toString(),
                            decoration: const InputDecoration(labelText: 'Qty'),
                            keyboardType: TextInputType.number,
                            onChanged: (v) => _items[index] = item.copyWith(quantity: double.tryParse(v) ?? 1),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            initialValue: item.unitPrice.toString(),
                            decoration: const InputDecoration(labelText: 'Price'),
                            keyboardType: TextInputType.number,
                            onChanged: (v) => _items[index] = item.copyWith(unitPrice: double.tryParse(v) ?? 0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: item.taxRate.toString(),
                            decoration: const InputDecoration(labelText: 'Tax %'),
                            keyboardType: TextInputType.number,
                            onChanged: (v) => _items[index] = item.copyWith(taxRate: double.tryParse(v) ?? 0),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            initialValue: item.discount.toString(),
                            decoration: const InputDecoration(labelText: 'Discount'),
                            keyboardType: TextInputType.number,
                            onChanged: (v) => _items[index] = item.copyWith(discount: double.tryParse(v) ?? 0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
