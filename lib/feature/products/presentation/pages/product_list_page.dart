import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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

  final Map<String, dynamic> _hierarchy = {
    'Tata': {
      'SUV': {
        'Safari': ['XE', 'XM', 'XT', 'XZ', 'XZ+', 'XZA', 'XZA+', 'Dark Edition', 'Adventure', 'Gold'],
        'Harrier': ['XE', 'XM', 'XT', 'XT+', 'XZ', 'XZ+', 'Dark', 'Kaziranga', 'Jet', 'Red Dark'],
        'Nexon': ['XE', 'XM', 'XM(S)', 'XZ', 'XZ+', 'XZ+(S)', 'XZ+(O)', 'Dark', 'Kaziranga'],
        'Punch': ['Pure', 'Adventure', 'Accomplished', 'Creative', 'Kaziranga', 'Camo'],
      },
      'EV': {
        'Nexon EV Prime': ['XM', 'XZ+', 'XZ+ Lux'],
        'Nexon EV Max': ['XZ+', 'XZ+ Lux'],
        'Tigor EV': ['XE', 'XM', 'XZ+', 'XZ+ DT'],
        'Tiago EV': ['XE', 'XT', 'XZ+', 'XZ+ Tech Lux'],
      },
      'Hatchback': {
        'Altroz': ['XE', 'XM', 'XM+', 'XT', 'XZ', 'XZ+', 'Dark', 'DCA'],
        'Tiago': ['XE', 'XM', 'XT', 'XZ', 'XZ+'],
      },
    },
    'Mahindra': {
      'SUV': {
        'XUV700': ['MX', 'AX3', 'AX5', 'AX7', 'AX7L', 'AX7L AWD', 'AX7 Luxury'],
        'Scorpio-N': ['Z2', 'Z4', 'Z6', 'Z8', 'Z8L', 'Z8L AWD'],
        'Scorpio Classic': ['S', 'S11'],
        'Thar': ['AX Opt', 'LX', 'LX Hard Top', 'LX Soft Top', '4WD', 'RWD'],
        'XUV300': ['W4', 'W6', 'W8', 'W8(O)', 'TurboSport'],
        'Bolero': ['B4', 'B6', 'B6 Opt'],
        'Bolero Neo': ['N4', 'N8', 'N10', 'N10 Opt'],
      },
    },
    'Toyota': {
      'MPV': {
        'Innova Hycross': ['G', 'GX', 'VX', 'VX FF', 'ZX', 'ZX(O)'],
        'Innova Crysta': ['G', 'GX', 'VX', 'ZX'],
        'Vellfire': ['Executive Lounge'],
      },
      'SUV': {
        'Fortuner': ['Standard', 'Legender', 'GR-S', '4x2', '4x4'],
        'Urban Cruiser Hyryder': ['E', 'S', 'G', 'V', 'Hybrid S', 'Hybrid G', 'Hybrid V'],
        'Hilux': ['Standard', 'High'],
        'Land Cruiser': ['LC300'],
      },
      'Sedan': {
        'Camry': ['Hybrid'],
        'Glanza': ['E', 'S', 'G', 'V'],
      },
    },
    'Hyundai': {
      'SUV': {
        'Creta': ['E', 'EX', 'S', 'S+', 'SX', 'SX(O)', 'Knight Edition'],
        'Venue': ['E', 'S', 'S+', 'S(O)', 'SX', 'SX(O)', 'N-Line'],
        'Alcazar': ['Prestige', 'Platinum', 'Signature', 'Adventure'],
        'Tucson': ['Platinum', 'Signature'],
        'Exter': ['EX', 'S', 'SX', 'SX(O)', 'SX(O) Connect'],
      },
      'Sedan': {
        'Verna': ['EX', 'S', 'SX', 'SX(O)', 'Turbo'],
        'Aura': ['E', 'S', 'SX', 'SX(O)'],
      },
      'Hatchback': {
        'i20': ['Magna', 'Sportz', 'Asta', 'Asta(O)', 'N-Line'],
        'Grand i10 Nios': ['Era', 'Magna', 'Sportz', 'Asta'],
      },
    },
    'Maruti Suzuki': {
      'SUV/MUV': {
        'Grand Vitara': ['Sigma', 'Delta', 'Zeta', 'Alpha', 'Zeta+', 'Alpha+'],
        'Brezza': ['LXi', 'VXi', 'ZXi', 'ZXi+', 'Black Edition'],
        'Jimny': ['Zeta', 'Alpha'],
        'Fronx': ['Sigma', 'Delta', 'Zeta', 'Alpha', 'Turbo'],
        'Ertiga': ['LXi', 'VXi', 'ZXi', 'ZXi+'],
        'XL6': ['Zeta', 'Alpha', 'Alpha+'],
      },
      'Hatchback': {
        'Swift': ['LXi', 'VXi', 'ZXi', 'ZXi+'],
        'Baleno': ['Sigma', 'Delta', 'Zeta', 'Alpha'],
        'Alto K10': ['Std', 'LXi', 'VXi', 'VXi+'],
        'WagonR': ['LXi', 'VXi', 'ZXi', 'ZXi+'],
      },
    },
    'Kia': {
      'SUV': {
        'Seltos': ['HTE', 'HTK', 'HTK+', 'HTX', 'HTX+', 'GTX+', 'X-Line'],
        'Sonet': ['HTE', 'HTK', 'HTK+', 'HTX', 'HTX+', 'GTX+', 'X-Line'],
        'EV6': ['GT-Line', 'GT-Line AWD'],
      },
      'MPV': {
        'Carens': ['Premium', 'Prestige', 'Prestige Plus', 'Luxury', 'Luxury Plus'],
      },
    },
    'Honda': {
      'Sedan': {
        'City': ['SV', 'V', 'VX', 'ZX', 'e:HEV Hybrid'],
        'City 4th Gen': ['SV', 'V'],
        'Amaze': ['E', 'S', 'VX'],
      },
      'SUV': {
        'Elevate': ['SV', 'V', 'VX', 'ZX'],
      },
    },
    'MG': {
      'SUV': {
        'Hector': ['Style', 'Shine', 'Smart', 'Sharp', 'Savvy Pro'],
        'Astor': ['Style', 'Super', 'Smart', 'Sharp', 'Savvy'],
        'Gloster': ['Super', 'Sharp', 'Savvy'],
      },
      'EV': {
        'ZS EV': ['Excite', 'Exclusive'],
        'Comet EV': ['Pace', 'Play', 'Plush'],
      },
    },
    'Volkswagen': {
      'SUV': {
        'Taigun': ['Comfortline', 'Highline', 'Topline', 'GT', 'GT Plus'],
        'Tiguan': ['Exclusive'],
      },
      'Sedan': {
        'Virtus': ['Comfortline', 'Highline', 'Topline', 'GT Plus'],
      },
    },
    'Skoda': {
      'SUV': {
        'Kushaq': ['Active', 'Ambition', 'Style', 'Monte Carlo'],
        'Kodiaq': ['Style', 'Sportline', 'L&K'],
      },
      'Sedan': {
        'Slavia': ['Active', 'Ambition', 'Style', 'Monte Carlo'],
        'Superb': ['L&K'],
      },
    },
  };

  void _resetSelections() {
    setState(() {
      _selectedBrand = null;
      _selectedCategory = null;
      _selectedProduct = null;
    });
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Brands Section
                      _buildBrandSection(),
                      
                      AnimatedSize(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        child: _selectedBrand != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 24),
                                  _buildHorizontalSelection(
                                    title: 'Category',
                                    items: (_hierarchy[_selectedBrand] as Map<String, dynamic>).keys.toList(),
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
                        child: _selectedCategory != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 24),
                                  _buildHorizontalSelection(
                                    title: 'Product',
                                    items: (_hierarchy[_selectedBrand][_selectedCategory] as Map<String, dynamic>).keys.toList(),
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
                      if (_selectedProduct != null) ...[
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
                                  '${(_hierarchy[_selectedBrand][_selectedCategory][_selectedProduct] as List).length} Models',
                                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildModelList(),
                      ] else ...[
                        _buildEmptyState(),
                      ],
                      const SizedBox(height: 120), 
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

  Widget _buildBrandSection() {
    final brands = _hierarchy.keys.toList();
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
                            brand.substring(0, 1).toUpperCase(),
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

  Widget _buildModelList() {
    final models = _hierarchy[_selectedBrand][_selectedCategory][_selectedProduct] as List<dynamic>;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: models.length,
      itemBuilder: (context, index) {
        final model = models[index].toString();
        return GestureDetector(
          onTap: () {
            context.push('/product-detail', extra: {
              'brand': _selectedBrand,
              'category': _selectedCategory,
              'product': _selectedProduct,
              'variant': model,
            });
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: GlassCard(
            padding: const EdgeInsets.all(12),
            borderRadius: 18,
            child: Row(
              children: [
                // Minimalist Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.directions_car_filled_rounded, color: AppColors.primary, size: 22),
                ),
                const SizedBox(width: 12),
                
                // Main Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            model,
                            style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.secondary, fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          _buildMiniTag('P', Colors.blue), // Compacted Petrol tag
                          const SizedBox(width: 4),
                          _buildMiniTag('A', Colors.orange), // Compacted Auto tag
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _buildSpecItem(Icons.speed_rounded, '18 kmpl'),
                          const SizedBox(width: 10),
                          _buildSpecItem(Icons.settings_input_component_rounded, '1498 cc'),
                        ],
                      ),
                    ],
                  ),
                ),

                // Pricing & Action
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹12.49 L*',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: AppColors.primary),
                    ),
                    const SizedBox(height: 4),
                    const Icon(Icons.arrow_forward_rounded, color: AppColors.textSecondary, size: 14),
                  ],
                ),
              ],
            ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMiniTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: color),
      ),
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
                ? 'Select a brand to discover\nthe future of driving'
                : _selectedCategory == null
                    ? 'What type of drive\nare you looking for?'
                    : 'Choose your hero model',
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
