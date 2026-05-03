import 'package:flutter/material.dart';
import 'plant_details_page.dart';

class FavoritesPage extends StatelessWidget {
  final Map<String, bool> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, String>> plantData = {
      'Monstera': {'type': 'Indoor Plant', 'imageAsset': 'assets/monstera.png'},
      'Snake Plant': {
        'type': 'Low Light',
        'imageAsset': 'assets/snakeplant.png',
      },
      'Peace Lily': {'type': 'Flowering', 'imageAsset': 'assets/image11.png'},
      'Fern': {'type': 'Humidity Lover', 'imageAsset': 'assets/image13.png'},
      'Orchid': {'type': 'Flowering', 'imageAsset': 'assets/orchid.png'},
      'Spider Plant': {
        'type': 'Air Purifier',
        'imageAsset': 'assets/spider.png',
      },
      'Rubber Plant': {
        'type': 'Tall Grower',
        'imageAsset': 'assets/rubber.png',
      },
      'Pothos': {'type': 'Trailing', 'imageAsset': 'assets/pothos.png'},
      'ZZ Plant': {'type': 'Low Light', 'imageAsset': 'assets/zz.png'},
      'Calathea': {'type': 'Prayer Plant', 'imageAsset': 'assets/calathea.png'},
      'Aloe Vera': {'type': 'Medicinal', 'imageAsset': 'assets/image12.png'},
      'Cactus': {'type': 'Desert Plant', 'imageAsset': 'assets/image1.jpg'},
      'Jade Plant': {'type': 'Money Plant', 'imageAsset': 'assets/jade.png'},
      'Echeveria': {
        'type': 'Rosette Shape',
        'imageAsset': 'assets/echeveria.png',
      },
      'Haworthia': {
        'type': 'Zebra Plant',
        'imageAsset': 'assets/haworthia.png',
      },
      'Sunflower': {
        'type': 'Tall Flower',
        'imageAsset': 'assets/sunflower.png',
      },
      'Lavender': {'type': 'Aromatic', 'imageAsset': 'assets/lavender.png'},
      'Basil': {'type': 'Herb', 'imageAsset': 'assets/basil.png'},
      'Rose': {'type': 'Flowering', 'imageAsset': 'assets/rose.png'},
      'Hibiscus': {'type': 'Tropical', 'imageAsset': 'assets/hibiscus.png'},
      'Jasmine': {'type': 'Fragrant', 'imageAsset': 'assets/jasmine.png'},
      'Mint': {'type': 'Herb', 'imageAsset': 'assets/mint.png'},
      'Tomato Plant': {'type': 'Vegetable', 'imageAsset': 'assets/tomato.png'},
      'Marigold': {
        'type': 'Annual Flower',
        'imageAsset': 'assets/marigold.png',
      },
      'Lily': {'type': 'Elegant', 'imageAsset': 'assets/lily.png'},
      'Daisy': {'type': 'Cheerful', 'imageAsset': 'assets/daisy.png'},
      'Tulip': {'type': 'Spring Flower', 'imageAsset': 'assets/tulip.png'},
    };

    List<Map<String, String>> favoritePlants = [];

    favorites.forEach((plantName, isFav) {
      if (isFav && plantData.containsKey(plantName)) {
        favoritePlants.add({
          'name': plantName,
          'type': plantData[plantName]!['type']!,
          'imageAsset': plantData[plantName]!['imageAsset']!,
        });
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

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
          'My Favorites',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),

      body: favoritePlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorite plants yet',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the heart icon on plants to add them here',
                    style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoritePlants.length,
              itemBuilder: (context, index) {
                final plant = favoritePlants[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              plant['imageAsset']!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.eco,
                                    size: 40,
                                    color: const Color(
                                      0xFF4CAF50,
                                    ).withOpacity(0.5),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plant['name']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                plant['type']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _getPrice(plant['name']!),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.water_drop,
                                      size: 10,
                                      color: Colors.blue[600],
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      _getWaterStatus(plant['name']!),
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.blue[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlantDetailsPage(
                                  plantName: plant['name']!,
                                  plantType: plant['type']!,
                                  watering: _getWateringInfo(plant['name']!),
                                  sunlight: _getSunlightInfo(plant['name']!),
                                  temperature: '18-27°C',
                                  difficulty: _getDifficultyInfo(
                                    plant['name']!,
                                  ),
                                  description: _getDescription(plant['name']!),
                                  imageAsset: plant['imageAsset']!,
                                  careTips: _getCareTips(plant['name']!),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4CAF50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          child: const Text(
                            'View',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  String _getPrice(String plantName) {
    switch (plantName) {
      case 'Monstera':
        return 'Rs. 2,500';
      case 'Snake Plant':
        return 'Rs. 1,800';
      case 'Peace Lily':
        return 'Rs. 2,200';
      case 'Fern':
        return 'Rs. 1,500';
      case 'Orchid':
        return 'Rs. 3,500';
      case 'Aloe Vera':
        return 'Rs. 1,200';
      case 'Cactus':
        return 'Rs. 800';
      case 'Rose':
        return 'Rs. 1,000';
      default:
        return 'Rs. 500';
    }
  }

  String _getWaterStatus(String plantName) {
    switch (plantName) {
      case 'Monstera':
        return 'Water in 3 days';
      case 'Snake Plant':
        return 'Water in 10 days';
      case 'Peace Lily':
        return 'Water in 5 days';
      case 'Fern':
        return 'Water in 2 days';
      case 'Orchid':
        return 'Water in 7 days';
      case 'Aloe Vera':
        return 'Water in 14 days';
      case 'Cactus':
        return 'Water in 21 days';
      case 'Rose':
        return 'Water in 4 days';
      default:
        return 'Water in 7 days';
    }
  }

  String _getWateringInfo(String plantName) {
    switch (plantName) {
      case 'Monstera':
        return 'Every 7-10 days';
      case 'Snake Plant':
        return 'Every 2-3 weeks';
      case 'Peace Lily':
        return 'Every 5-7 days';
      case 'Fern':
        return 'Every 3-4 days';
      case 'Orchid':
        return 'Every 5-7 days';
      case 'Aloe Vera':
        return 'Every 2-3 weeks';
      case 'Cactus':
        return 'Every 3-4 weeks';
      case 'Rose':
        return 'Every 3-4 days';
      default:
        return 'Weekly';
    }
  }

  String _getSunlightInfo(String plantName) {
    switch (plantName) {
      case 'Monstera':
      case 'Peace Lily':
      case 'Fern':
        return 'Indirect light';
      case 'Snake Plant':
        return 'Low to bright light';
      case 'Cactus':
      case 'Aloe Vera':
        return 'Bright direct light';
      case 'Rose':
      case 'Sunflower':
        return 'Full sun';
      default:
        return 'Indirect light';
    }
  }

  String _getDifficultyInfo(String plantName) {
    switch (plantName) {
      case 'Cactus':
      case 'Snake Plant':
      case 'Aloe Vera':
        return 'Very Easy';
      case 'Monstera':
      case 'Peace Lily':
        return 'Easy';
      case 'Fern':
      case 'Orchid':
        return 'Moderate';
      default:
        return 'Easy';
    }
  }

  String _getDescription(String plantName) {
    return 'A beautiful $plantName that will brighten your space.';
  }

  List<String> _getCareTips(String plantName) {
    return [
      'Water when soil feels dry',
      'Provide adequate sunlight',
      'Use well-draining soil',
      'Remove dead leaves regularly',
    ];
  }
}
