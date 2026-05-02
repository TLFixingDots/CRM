import 'package:fix_crm_new/feature/products/presentation/widgets/product_picker.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';

class LeadFormPage extends StatefulWidget {
  final Map<String, dynamic>? lead; // If provided, we are in update mode

  const LeadFormPage({super.key, this.lead});

  @override
  State<LeadFormPage> createState() => _LeadFormPageState();
}

class _LeadFormPageState extends State<LeadFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _companyController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _categoryController;
  late TextEditingController _modelController;
  String _status = 'New';
  String _priority = 'Medium';
  String _source = 'Direct Call';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.lead?['name'] ?? '');
    _companyController = TextEditingController(text: widget.lead?['company'] ?? '');
    _phoneController = TextEditingController(text: widget.lead?['phone'] ?? '');
    _emailController = TextEditingController(text: widget.lead?['email'] ?? '');
    _categoryController = TextEditingController(text: widget.lead?['productCategory'] ?? '');
    _modelController = TextEditingController(text: widget.lead?['productModel'] ?? '');
    if (widget.lead != null) {
      _status = widget.lead!['status'] ?? 'New';
      _priority = widget.lead!['priority'] ?? 'Medium';
      _source = widget.lead!['source'] ?? 'Direct Call';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _categoryController.dispose();
    _modelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildCircleAction(Icons.arrow_back_ios_new_rounded, () => Navigator.pop(context)),
        ),
        title: Text(
          widget.lead == null ? 'Create New Lead' : 'Edit Lead Details',
          style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w900, fontSize: 18),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.mainGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  _buildFormCard(),
                  const SizedBox(height: 40),
                  _buildSubmitButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleAction(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        ),
        child: Icon(icon, color: AppColors.secondary, size: 18),
      ),
    );
  }

  Widget _buildFormCard() {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('FULL NAME', _nameController, Icons.person_outline_rounded),
          const SizedBox(height: 24),
          _buildTextField('COMPANY NAME', _companyController, Icons.business_center_outlined),
          const SizedBox(height: 24),
          _buildTextField('PHONE NUMBER', _phoneController, Icons.phone_android_rounded, keyboardType: TextInputType.phone),
          const SizedBox(height: 24),
          _buildTextField('EMAIL ADDRESS', _emailController, Icons.alternate_email_rounded, keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 32),
          _buildSectionHeader('PRODUCT INFORMATION', Icons.inventory_2_rounded),
          const SizedBox(height: 16),
          _buildProductSelectionField(),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _buildDropdownField('STATUS', ['New', 'Contacted', 'Hot', 'Pending', 'Closed'], _status, (val) => setState(() => _status = val!))),
              const SizedBox(width: 16),
              Expanded(child: _buildDropdownField('PRIORITY', ['Low', 'Medium', 'High'], _priority, (val) => setState(() => _priority = val!))),
            ],
          ),
          const SizedBox(height: 24),
          _buildDropdownField('LEAD SOURCE', ['Direct Call', 'Web Inquiry', 'Referral', 'Social Media', 'Other'], _source, (val) => setState(() => _source = val!)),
        ],
      ),
    );
  }

  Widget _buildProductSelectionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SELECT PRODUCT',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.textSecondary, letterSpacing: 1),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            ProductPicker.show(context, (product) {
              setState(() {
                _categoryController.text = product['category'];
                _modelController.text = product['model'];
              });
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                const Icon(Icons.search_rounded, color: AppColors.primary, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _modelController.text.isEmpty ? 'Tap to choose from Catalog' : '${_categoryController.text} / ${_modelController.text}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700, 
                      color: _modelController.text.isEmpty ? AppColors.textSecondary : AppColors.secondary, 
                      fontSize: 14
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textSecondary),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 18),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: AppColors.primary, letterSpacing: 1.5),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon, {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.textSecondary, letterSpacing: 1),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.secondary, fontSize: 15),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              hintText: 'Enter ${label.toLowerCase()}',
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.5), fontWeight: FontWeight.normal),
            ),
            validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> options, String currentValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.textSecondary, letterSpacing: 1),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentValue,
              isExpanded: true,
              icon: const Icon(Icons.expand_more_rounded, color: AppColors.secondary),
              style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.secondary, fontSize: 14),
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppColors.secondary, Color(0xFF34495E)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(widget.lead == null ? 'Lead created successfully!' : 'Lead updated successfully!'),
                backgroundColor: AppColors.success,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          widget.lead == null ? 'CREATE LEAD' : 'UPDATE DETAILS',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1.5),
        ),
      ),
    );
  }
}
