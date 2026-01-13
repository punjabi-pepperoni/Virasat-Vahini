import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/region.dart';
import '../../domain/entities/state_entity.dart';
import 'state_details_page.dart';

class RegionDetailsPage extends StatelessWidget {
  final Region region;

  const RegionDetailsPage({super.key, required this.region});

  // Mock Data - In real app, fetch from Bloc/Repo
  List<StateEntity> get _states => const [
        StateEntity(id: 'delhi', name: 'Delhi', imagePath: ''),
        StateEntity(id: 'up', name: 'Uttar Pradesh', imagePath: ''),
        StateEntity(id: 'rajasthan', name: 'Rajasthan', imagePath: ''),
        StateEntity(id: 'punjab', name: 'Punjab', imagePath: ''),
        StateEntity(id: 'uttarakhand', name: 'Uttarakhand', imagePath: ''),
        StateEntity(id: 'jk', name: 'Jammu and Kashmir', imagePath: ''),
      ];

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
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${region.name} India',
              style: GoogleFonts.cinzel(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _states.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final state = _states[index];
                return _buildStateCard(context, state);
              },
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

  Widget _buildStateCard(BuildContext context, StateEntity state) {
    return Container(
      height: 120, // Adjust height as needed
      decoration: BoxDecoration(
        color: const Color(0xFF570A57).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => StateDetailsPage(state: state)));
          },
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  state.name,
                  style: GoogleFonts.cinzel(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              // Image placeholder
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Colors.white.withOpacity(0.1),
                  // image: DecorationImage(...) // Add image here
                ),
                child: const Icon(Icons.image, color: Colors.white24, size: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
