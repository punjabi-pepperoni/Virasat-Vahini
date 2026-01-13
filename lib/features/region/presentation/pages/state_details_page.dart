import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/state_entity.dart';

class StateDetailsPage extends StatelessWidget {
  final StateEntity state;

  const StateDetailsPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Icon(Icons.temple_buddhist, size: 32),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              state.name,
              style: GoogleFonts.cinzel(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildCategoryCard('Culture', 'assets/images/culture.png'),
                const SizedBox(height: 16),
                _buildCategoryCard('Clothing', 'assets/images/clothing.png'),
                const SizedBox(height: 16),
                _buildCategoryCard('Monuments', 'assets/images/monuments.png'),
                const SizedBox(height: 16),
                _buildCategoryCard(
                    'Iconic Markets', 'assets/images/markets.png'),
                const SizedBox(height: 16),
                _buildCategoryCard('Food', 'assets/images/food.png'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple.shade400,
        child: const Icon(Icons.hub, color: Colors.white),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        // In real app, add image background
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.cinzel(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
