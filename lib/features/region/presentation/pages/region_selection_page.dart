import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/region.dart';
import 'region_details_page.dart';

class RegionSelectionPage extends StatelessWidget {
  const RegionSelectionPage({super.key});

  final List<Region> regions = const [
    Region(id: 'north', name: 'North', imagePath: ''),
    Region(id: 'east', name: 'East', imagePath: ''),
    Region(id: 'west', name: 'West', imagePath: ''),
    Region(id: 'south', name: 'South', imagePath: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Icon(Icons.temple_buddhist, size: 32), // Placeholder logo
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Select a region to continue',
              style: GoogleFonts.raleway(
                fontSize: 18,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: regions.length,
                itemBuilder: (context, index) {
                  final region = regions[index];
                  return _buildRegionCard(context, region);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple.shade400, // Gradient placeholder
        child: const Icon(Icons.hub, color: Colors.white),
      ),
    );
  }

  Widget _buildRegionCard(BuildContext context, Region region) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.1), // Glassmorphism base
        image: region.imagePath.isNotEmpty
            ? DecorationImage(
                image: AssetImage(region.imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              )
            : null, // Fallback if no image
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RegionDetailsPage(region: region)));
          },
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Text(
              region.name,
              style: GoogleFonts.cinzel(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
