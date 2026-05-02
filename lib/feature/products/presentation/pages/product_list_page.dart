import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  int _currentLevel = 0; // 0: Brands, 1: Categories, 2: Products, 3: Models
  String? _selectedBrand;
  String? _selectedCategory;
  String? _selectedProduct;

  final Map<String, dynamic> _hierarchy = {
    'Tata': {
      'SUV': {
        'Safari': ['XE', 'XM', 'XT', 'XZA+'],
        'Harrier': ['XE', 'XM', 'XT', 'XZ'],
        'Nexon': ['XE', 'XM', 'XZ'],
      },
      'EV': {
        'Nexon EV': ['Prime', 'Max'],
        'Tigor EV': ['XE', 'XT', 'XZ+'],
      },
    },
    'Mahindra': {
      'SUV': {
        'XUV700': ['MX', 'AX3', 'AX5', 'AX7'],
        'Scorpio-N': ['Z2', 'Z4', 'Z6', 'Z8'],
        'Thar': ['AX Opt', 'LX'],
      },
    },
    'Toyota': {
      'MPV': {
        'Innova Hycross': ['G', 'GX', 'VX', 'ZX'],
        'Innova Crysta': ['G', 'GX', 'VX', 'ZX'],
      },
      'SUV': {
        'Fortuner': ['Standard', 'Legender', 'GR-S'],
      },
    },
  };

  void _goBack() {
    if (_currentLevel > 0) {
      setState(() => _currentLevel--);
    } else {
      Navigator.pop(context);
    }
  }

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
              _buildHeader(),
              _buildBreadcrumbs(),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.05, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: _buildCurrentLevelView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          _buildCircleAction(Icons.arrow_back_ios_new_rounded, _goBack),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Catalog',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.secondary, letterSpacing: -1),
              ),
              Text(
                'Select Brand to Begin',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primary, letterSpacing: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbs() {
    if (_currentLevel == 0) return const SizedBox(height: 20);
    
    List<String> parts = [];
    if (_selectedBrand != null) parts.add(_selectedBrand!);
    if (_selectedCategory != null && _currentLevel > 1) parts.add(_selectedCategory!);
    if (_selectedProduct != null && _currentLevel > 2) parts.add(_selectedProduct!);

    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: parts.length,
        separatorBuilder: (_, __) => const Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.textSecondary),
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              parts[index],
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.primary),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCurrentLevelView() {
    switch (_currentLevel) {
      case 0: return _buildBrandGrid();
      case 1: return _buildCategoryList();
      case 2: return _buildProductGrid();
      case 3: return _buildModelList();
      default: return const SizedBox();
    }
  }

  Widget _buildBrandGrid() {
    final brands = _hierarchy.keys.toList();
    return ListView.builder(
      key: const ValueKey('brands'),
      padding: const EdgeInsets.all(24),
      itemCount: brands.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildWideSelectableCard(
            title: brands[index],
            subtitle: 'Explore Category',
            icon: Icons.directions_car_rounded,
            onTap: () {
              setState(() {
                _selectedBrand = brands[index];
                _currentLevel = 1;
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildCategoryList() {
    final categories = (_hierarchy[_selectedBrand] as Map<String, dynamic>).keys.toList();
    return ListView.builder(
      key: const ValueKey('categories'),
      padding: const EdgeInsets.all(24),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildWideSelectableCard(
            title: categories[index],
            subtitle: '${(_hierarchy[_selectedBrand][categories[index]] as Map).length} Products Available',
            icon: Icons.category_rounded,
            onTap: () {
              setState(() {
                _selectedCategory = categories[index];
                _currentLevel = 2;
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildProductGrid() {
    final products = (_hierarchy[_selectedBrand][_selectedCategory] as Map<String, dynamic>).keys.toList();
    return ListView.builder(
      key: const ValueKey('products'),
      padding: const EdgeInsets.all(24),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildWideSelectableCard(
            title: products[index],
            subtitle: 'Tap to view models',
            icon: Icons.directions_car_filled_rounded,
            onTap: () {
              setState(() {
                _selectedProduct = products[index];
                _currentLevel = 3;
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildModelList() {
    final models = _hierarchy[_selectedBrand][_selectedCategory][_selectedProduct] as List<dynamic>;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('AVAILABLE MODELS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: AppColors.textSecondary, letterSpacing: 1.5)),
        ),
        Expanded(
          child: ListView.builder(
            key: const ValueKey('models'),
            padding: const EdgeInsets.all(24),
            itemCount: models.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GlassCard(
                  padding: const EdgeInsets.all(20),
                  borderRadius: 20,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.settings_suggest_rounded, color: AppColors.primary, size: 20),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(models[index].toString(), style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.secondary, fontSize: 16)),
                            Text('Full Specs Available', style: TextStyle(fontSize: 11, color: AppColors.textSecondary.withValues(alpha: 0.7))),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textSecondary),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSelectableCard({required String title, String? subtitle, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        borderRadius: 24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.secondary.withValues(alpha: 0.05), shape: BoxShape.circle),
              child: Icon(icon, color: AppColors.primary, size: 30),
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.secondary, fontSize: 14), textAlign: TextAlign.center),
            if (subtitle != null)
              Text(subtitle, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildWideSelectableCard({required String title, required String subtitle, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.all(20),
        borderRadius: 24,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(15)),
              child: Icon(icon, color: AppColors.primary, size: 24),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.secondary, fontSize: 17)),
                  Text(subtitle, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAction(IconData icon, VoidCallback? onTap) {
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
}
