import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';

class ProductDetailPage extends StatelessWidget {
  final String brand;
  final String category;
  final String product;
  final String variant;

  const ProductDetailPage({
    super.key,
    required this.brand,
    required this.category,
    required this.product,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.mainGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeroImage(),
                      const SizedBox(height: 24),
                      _buildMainInfo(),
                      const SizedBox(height: 32),
                      _buildSectionTitle('Specifications'),
                      const SizedBox(height: 16),
                      _buildSpecsGrid(),
                      const SizedBox(height: 32),
                      _buildSectionTitle('Key Highlights'),
                      const SizedBox(height: 16),
                      _buildHighlights(),
                      const SizedBox(height: 32),
                      _buildActionButtons(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          _buildCircleAction(Icons.arrow_back_ios_new_rounded, () => Navigator.pop(context)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.secondary, letterSpacing: -1),
              ),
              Text(
                '$brand • $variant',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primary, letterSpacing: 1),
              ),
            ],
          ),
          const Spacer(),
          _buildCircleAction(Icons.share_outlined, () {}),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?auto=format&fit=crop&q=80&w=1000',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.4),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  category.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAction(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
        ),
        child: Icon(icon, color: AppColors.secondary, size: 22),
      ),
    );
  }

  Widget _buildMainInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primary.withValues(alpha: 0.8)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$product $variant',
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppColors.secondary, letterSpacing: -1),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Starting from',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
                ),
                Text(
                  '₹12.49 Lakh*',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.primary),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(color: Colors.black12),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: AppColors.secondary, letterSpacing: 1.5),
    );
  }

  Widget _buildSpecsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.5,
      children: [
        _buildSpecCard(Icons.settings_input_component_rounded, 'Engine', '1498 cc'),
        _buildSpecCard(Icons.bolt_rounded, 'Max Power', '113.18 bhp'),
        _buildSpecCard(Icons.speed_rounded, 'Mileage', '18.4 kmpl'),
        _buildSpecCard(Icons.airline_seat_recline_extra_rounded, 'Seating', '5 Seater'),
        _buildSpecCard(Icons.local_gas_station_rounded, 'Fuel Type', 'Petrol/Diesel'),
        _buildSpecCard(Icons.settings_suggest_rounded, 'Transmission', 'Automatic'),
      ],
    );
  }

  Widget _buildSpecCard(IconData icon, String label, String value) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      borderRadius: 16,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
              Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.secondary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHighlights() {
    final highlights = [
      'Advanced Driver Assistance Systems (ADAS)',
      'Panoramic Sunroof with Voice Control',
      'Ventilated Front Seats',
      '360 Degree Surround View Camera',
    ];

    return Column(
      children: highlights.map((h) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            const Icon(Icons.check_circle_rounded, size: 18, color: Colors.green),
            const SizedBox(width: 12),
            Text(h, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.secondary)),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildActionButtons() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.share_rounded, size: 20),
        label: const Text('Share Product Brochure', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
      ),
    );
  }
}
