import 'package:flutter/material.dart';

class CareTipsPage extends StatelessWidget {
  const CareTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Plant Care Tips',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: const Color(0xFFF3E5F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(
                    Icons.tips_and_updates,
                    size: 45,
                    color: Color(0xFF4CAF50),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plant Care Guide',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Essential tips to keep your plants healthy and happy!',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Watering
          _buildTipCard(
            title: '💧 Watering Tips',
            icon: Icons.water_drop,
            color: Colors.blue,
            tips: [
              'Water your plants when the top 1-2 inches of soil feel dry',
              'Avoid overwatering - it\'s the #1 cause of plant death',
              'Use room temperature water for most plants',
              'Water in the morning to allow excess moisture to evaporate',
              'Different plants have different watering needs',
            ],
          ),

          const SizedBox(height: 16),

          // Sunlight
          _buildTipCard(
            title: '☀️ Sunlight Tips',
            icon: Icons.wb_sunny,
            color: Colors.orange,
            tips: [
              'Research your plant\'s light requirements',
              'Low light plants: Snake Plant, ZZ Plant, Peace Lily',
              'Bright indirect light: Monstera, Ferns, Orchids',
              'Direct sun: Cactus, Succulents, Sunflowers',
              'Rotate plants occasionally for even growth',
            ],
          ),

          const SizedBox(height: 16),

          // Soil & Fertilizer
          _buildTipCard(
            title: '🌱 Soil & Fertilizer',
            icon: Icons.agriculture,
            color: Colors.brown,
            tips: [
              'Use well-draining potting mix for most indoor plants',
              'Cactus and succulents need sandy, fast-draining soil',
              'Fertilize during growing season (spring and summer)',
              'Reduce fertilizing in winter when plants are dormant',
              'Don\'t fertilize newly repotted plants for 4-6 weeks',
            ],
          ),

          const SizedBox(height: 16),

          // Temperature & Humidity
          _buildTipCard(
            title: '🌡️ Temperature & Humidity',
            icon: Icons.thermostat,
            color: Colors.red,
            tips: [
              'Most indoor plants prefer 18-27°C (65-80°F)',
              'Keep plants away from drafts, AC vents, and heaters',
              'Tropical plants like ferns love high humidity',
              'Mist leaves or use a humidifier for humidity-loving plants',
              'Group plants together to create humid microclimate',
            ],
          ),

          const SizedBox(height: 16),

          // Common Problems
          _buildTipCard(
            title: '⚠️ Common Problems & Solutions',
            icon: Icons.warning,
            color: Colors.amber,
            tips: [
              'Yellow leaves: Usually overwatering - let soil dry out',
              'Brown crispy edges: Low humidity or underwatering',
              'Drooping leaves: Needs water or too much direct sun',
              'Small pests: Wipe leaves with soapy water',
              'Leggy growth: Not enough light - move to brighter spot',
            ],
          ),

          const SizedBox(height: 16),

          // Beginner Friendly Plants
          _buildTipCard(
            title: '🌿 Best Plants for Beginners',
            icon: Icons.emoji_events,
            color: Colors.green,
            tips: [
              'Snake Plant - Almost impossible to kill',
              'ZZ Plant - Thrives on neglect',
              'Pothos - Grows in almost any condition',
              'Spider Plant - Very forgiving',
              'Aloe Vera - Easy and useful',
            ],
          ),

          const SizedBox(height: 16),

          // Tools You Need
          _buildTipCard(
            title: '🛠️ Essential Tools',
            icon: Icons.build,
            color: Colors.grey,
            tips: [
              'Watering can with narrow spout',
              'Pruning shears for trimming',
              'Moisture meter to check soil',
              'Spray bottle for misting',
              'Gloves for handling soil and thorny plants',
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildTipCard({
    required String title,
    required IconData icon,
    required Color color,
    required List<String> tips,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            ...tips.map(
              (tip) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: const Color(0xFF4CAF50),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        tip,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
