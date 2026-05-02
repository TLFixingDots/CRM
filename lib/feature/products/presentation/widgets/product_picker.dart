import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';

class ProductPicker extends StatelessWidget {
  final Function(Map<String, dynamic>) onProductSelected;

  const ProductPicker({super.key, required this.onProductSelected});

  static void show(BuildContext context, Function(Map<String, dynamic>) onProductSelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => ProductPicker(onProductSelected: onProductSelected),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {'name': 'Excavator XP-200', 'category': 'Construction', 'model': 'XP-200', 'price': '45.0 L'},
      {'name': 'Power Drill Pro-X', 'category': 'Tools', 'model': 'PD-X1', 'price': '12.5 K'},
      {'name': 'VoltGuard 5000', 'category': 'Generators', 'model': 'VG-5K', 'price': '85.0 K'},
      {'name': 'Heavy Duty Crane H1', 'category': 'Construction', 'model': 'HDC-H1', 'price': '1.2 Cr'},
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        gradient: AppColors.mainGradient,
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2))),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Select Product',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.secondary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GlassCard(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              borderRadius: 15,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search by model or category...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search_rounded, color: AppColors.primary),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      onProductSelected(p);
                      Navigator.pop(context);
                    },
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      borderRadius: 20,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
                            child: const Icon(Icons.precision_manufacturing_rounded, color: AppColors.primary, size: 20),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p['name']!, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.secondary)),
                                Text('${p['category']} • ${p['model']}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                              ],
                            ),
                          ),
                          Text(
                            '₹${p['price']}',
                            style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
