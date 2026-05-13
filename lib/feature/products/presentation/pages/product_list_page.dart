import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/product_provider.dart';
import '../../data/models/product_model.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/custom_widgets/responsive_widgets.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  String? _selectedBrand;
  String? _selectedCategory;
  String? _selectedProduct;

  Map<String, Map<String, Map<String, List<Product>>>> _computeHierarchy(List<Product> products) {
    Map<String, Map<String, Map<String, List<Product>>>> hierarchy = {};
    for (var product in products) {
      String brandName = product.brand?.name ?? 'Unknown';
      String categoryName = product.category?.name ?? 'General';
      String productName = product.name;

      if (!hierarchy.containsKey(brandName)) {
        hierarchy[brandName] = {};
      }
      if (!hierarchy[brandName]!.containsKey(categoryName)) {
        hierarchy[brandName]![categoryName] = {};
      }
      if (!hierarchy[brandName]![categoryName]!.containsKey(productName)) {
        hierarchy[brandName]![categoryName]![productName] = [];
      }
      hierarchy[brandName]![categoryName]![productName]!.add(product);
    }
    return hierarchy;
  }

  void _resetSelections() {
    setState(() {
      _selectedBrand = null;
      _selectedCategory = null;
      _selectedProduct = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsProvider);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              
              Expanded(
                child: productsAsync.when(
                  data: (products) {
                    final hierarchy = _computeHierarchy(products);
                    final brands = hierarchy.keys.toList();

                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brands Section
                          _buildBrandSection(brands),
                          
                          AnimatedSize(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            child: _selectedBrand != null && hierarchy.containsKey(_selectedBrand)
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 24),
                                      _buildHorizontalSelection(
                                        title: 'Category',
                                        items: hierarchy[_selectedBrand]!.keys.toList(),
                                        selectedValue: _selectedCategory,
                                        onSelected: (val) => setState(() {
                                          _selectedCategory = val;
                                          _selectedProduct = null;
                                        }),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ),

                          AnimatedSize(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            child: _selectedCategory != null && hierarchy[_selectedBrand]?.containsKey(_selectedCategory) == true
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 24),
                                      _buildHorizontalSelection(
                                        title: 'Product',
                                        items: hierarchy[_selectedBrand]![_selectedCategory]!.keys.toList(),
                                        selectedValue: _selectedProduct,
                                        onSelected: (val) => setState(() {
                                          _selectedProduct = val;
                                        }),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ),

                          const SizedBox(height: 32),
                          
                          // Results Title
                          if (_selectedProduct != null && hierarchy[_selectedBrand]?[_selectedCategory]?.containsKey(_selectedProduct) == true) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                children: [
                                  const Text(
                                    'AVAILABLE VARIANTS',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: AppColors.secondary, letterSpacing: 1.5),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '${hierarchy[_selectedBrand]![_selectedCategory]![_selectedProduct]!.length} Models',
                                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.primary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildModelList(hierarchy[_selectedBrand]![_selectedCategory]![_selectedProduct]!),
                          ] else ...[
                            _buildEmptyState(),
                          ],
                          const SizedBox(height: 120), 
                        ],
                      ),
                    );
                  },
                  loading: () => _buildSkeletonLoader(),
                  error: (err, stack) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 48, color: Colors.red),
                        const SizedBox(height: 16),
                        Text('Failed to load products: $err', textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => ref.refresh(productsProvider),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonLoader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Brand skeleton
            Container(width: 80, height: 10, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5))),
            const SizedBox(height: 15),
            Row(
              children: List.generate(4, (index) => Container(
                width: 60, height: 60, margin: const EdgeInsets.only(right: 15),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              )),
            ),
            const SizedBox(height: 40),
            // Product list skeleton
            ...List.generate(5, (index) => Container(
              height: 80, width: double.infinity, margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          _buildCircleAction(Icons.arrow_back_ios_new_rounded, () => Navigator.pop(context)),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Products',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.secondary, letterSpacing: -1),
              ),
              Text(
                'Explore premium models',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primary, letterSpacing: 1),
              ),
            ],
          ),
          const Spacer(),
          if (_selectedBrand != null)
            _buildCircleAction(Icons.refresh_rounded, _resetSelections),
        ],
      ),
    );
  }

  Widget _buildBrandSection(List<String> brands) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'SELECT BRAND',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.textSecondary, letterSpacing: 1),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              final isSelected = _selectedBrand == brand;
              return GestureDetector(
                onTap: () => setState(() {
                  _selectedBrand = brand;
                  _selectedCategory = null;
                  _selectedProduct = null;
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 70,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.secondary.withValues(alpha: 0.05) : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: isSelected 
                              ? const LinearGradient(colors: [AppColors.secondary, Color(0xFF2C3E50)])
                              : LinearGradient(colors: [Colors.white.withValues(alpha: 0.5), Colors.white.withValues(alpha: 0.2)]),
                          shape: BoxShape.circle,
                          boxShadow: isSelected
                              ? [BoxShadow(color: AppColors.secondary.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4))]
                              : [],
                          border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                        child: Center(
                          child: Text(
                            brand.isEmpty ? '?' : brand.substring(0, 1).toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: isSelected ? Colors.white : AppColors.secondary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        brand,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                          color: isSelected ? AppColors.secondary : AppColors.textSecondary,
                        ),
                      ),
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

  Widget _buildHorizontalSelection({
    required String title,
    required List<String> items,
    required String? selectedValue,
    required Function(String) onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'SELECT $title'.toUpperCase(),
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.textSecondary, letterSpacing: 1),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isSelected = selectedValue == item;
              return GestureDetector(
                onTap: () => onSelected(item),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    gradient: isSelected 
                        ? const LinearGradient(colors: [AppColors.secondary, Color(0xFF2C3E50)])
                        : LinearGradient(colors: [Colors.white.withValues(alpha: 0.4), Colors.white.withValues(alpha: 0.2)]),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                    boxShadow: isSelected
                        ? [BoxShadow(color: AppColors.secondary.withValues(alpha: 0.2), blurRadius: 6, offset: const Offset(0, 3))]
                        : [],
                  ),
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                        color: isSelected ? Colors.white : AppColors.secondary,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildModelList(List<Product> models) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: models.length,
      itemBuilder: (context, index) {
        final product = models[index];
        return GestureDetector(
          onTap: () {
            context.push('/product-detail', extra: {
              'brand': product.brand?.name ?? 'Unknown',
              'category': product.category?.name ?? 'General',
              'product': product.name,
              'variant': product.alias ?? product.printName ?? 'Standard',
              'productObject': product, 
            });
          },
          child: RepaintBoundary(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: GlassCard(
                padding: const EdgeInsets.all(12),
                borderRadius: 18,
                child: Row(
                  children: [
                    // Image/Icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: product.fullLogoUrl != null
                            ? CachedNetworkImage(
                                imageUrl: product.fullLogoUrl!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(color: Colors.white),
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.inventory_2_rounded, color: AppColors.primary, size: 22),
                              )
                            : const Icon(Icons.inventory_2_rounded, color: AppColors.primary, size: 22),
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Main Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.printName ?? product.name,
                            style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.secondary, fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              _buildSpecItem(Icons.category_rounded, product.category?.name ?? 'General'),
                              const SizedBox(width: 10),
                              _buildSpecItem(Icons.branding_watermark_rounded, product.brand?.name ?? 'Unknown'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Pricing
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '₹${product.salePrice ?? product.mrp ?? '0'}',
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: AppColors.primary),
                        ),
                        const SizedBox(height: 4),
                        const Icon(Icons.arrow_forward_rounded, color: AppColors.textSecondary, size: 14),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpecItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 10, color: AppColors.textSecondary.withValues(alpha: 0.4)),
        const SizedBox(width: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.auto_awesome_motion_rounded, size: 80, color: AppColors.secondary.withValues(alpha: 0.1)),
          ),
          const SizedBox(height: 24),
          Text(
            _selectedBrand == null
                ? 'Select a brand to discover\navailable products'
                : _selectedCategory == null
                    ? 'What category of products\nare you looking for?'
                    : 'Choose your product model',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15, 
              fontWeight: FontWeight.w700, 
              color: AppColors.textSecondary.withValues(alpha: 0.4),
              height: 1.5,
            ),
          ),
        ],
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
