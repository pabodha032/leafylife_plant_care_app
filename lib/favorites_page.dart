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
      'Peace Lily': {'type': 'Flowering', 'imageAsset': 'assets/peacelily.png'},
      'Fern': {'type': 'Humidity Lover', 'imageAsset': 'assets/fern.png'},
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
      'Calathea': {
        'type': 'Prayer Plant',
        'imageAsset': 'assets/calathea2.png',
      },
      'Aloe Vera': {'type': 'Medicinal', 'imageAsset': 'assets/aloevera.png'},
      'Cactus': {'type': 'Desert Plant', 'imageAsset': 'assets/cactus.png'},
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
      'Rose': {'type': 'Flowering', 'imageAsset': 'assets/rose2.png'},
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
      case 'Spider Plant':
        return 'Rs. 1,200';
      case 'Rubber Plant':
        return 'Rs. 2,800';
      case 'Pothos':
        return 'Rs. 900';
      case 'ZZ Plant':
        return 'Rs. 2,000';
      case 'Calathea':
        return 'Rs. 2,500';

      case 'Aloe Vera':
        return 'Rs. 1,200';
      case 'Cactus':
        return 'Rs. 800';
      case 'Jade Plant':
        return 'Rs. 1,500';
      case 'Echeveria':
        return 'Rs. 600';
      case 'Haworthia':
        return 'Rs. 700';
      case 'Burro\'s Tail':
        return 'Rs. 850';
      case 'String of Pearls':
        return 'Rs. 950';
      case 'Agave':
        return 'Rs. 1,800';

      case 'Sunflower':
        return 'Rs. 400';
      case 'Lavender':
        return 'Rs. 1,000';
      case 'Basil':
        return 'Rs. 300';
      case 'Rose':
        return 'Rs. 1,000';
      case 'Hibiscus':
        return 'Rs. 1,200';
      case 'Jasmine':
        return 'Rs. 900';
      case 'Mint':
        return 'Rs. 250';
      case 'Tomato Plant':
        return 'Rs. 350';
      case 'Marigold':
        return 'Rs. 400';
      case 'Bougainvillea':
        return 'Rs. 1,500';

      case 'Lily':
        return 'Rs. 1,800';
      case 'Daisy':
        return 'Rs. 600';
      case 'Tulip':
        return 'Rs. 1,200';

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
      case 'Spider Plant':
        return 'Water in 5 days';
      case 'Rubber Plant':
        return 'Water in 7 days';
      case 'Pothos':
        return 'Water in 5 days';
      case 'ZZ Plant':
        return 'Water in 14 days';
      case 'Calathea':
        return 'Water in 3 days';

      case 'Aloe Vera':
        return 'Water in 14 days';
      case 'Cactus':
        return 'Water in 21 days';
      case 'Jade Plant':
        return 'Water in 14 days';
      case 'Echeveria':
        return 'Water in 14 days';
      case 'Haworthia':
        return 'Water in 14 days';
      case 'Burro\'s Tail':
        return 'Water in 14 days';
      case 'String of Pearls':
        return 'Water in 10 days';
      case 'Agave':
        return 'Water in 21 days';

      case 'Sunflower':
        return 'Water in 2 days';
      case 'Lavender':
        return 'Water in 7 days';
      case 'Basil':
        return 'Water in 2 days';
      case 'Rose':
        return 'Water in 4 days';
      case 'Hibiscus':
        return 'Water in 3 days';
      case 'Jasmine':
        return 'Water in 4 days';
      case 'Mint':
        return 'Water in 2 days';
      case 'Tomato Plant':
        return 'Water in 2 days';
      case 'Marigold':
        return 'Water in 3 days';
      case 'Bougainvillea':
        return 'Water in 7 days';

      case 'Lily':
        return 'Water in 5 days';
      case 'Daisy':
        return 'Water in 4 days';
      case 'Tulip':
        return 'Water in 5 days';

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
      case 'Spider Plant':
        return 'Every 7-10 days';
      case 'Rubber Plant':
        return 'Every 7-10 days';
      case 'Pothos':
        return 'Every 7-10 days';
      case 'ZZ Plant':
        return 'Every 2-3 weeks';
      case 'Calathea':
        return 'Every 5-7 days';

      case 'Aloe Vera':
        return 'Every 2-3 weeks';
      case 'Cactus':
        return 'Every 3-4 weeks';
      case 'Jade Plant':
        return 'Every 2-3 weeks';
      case 'Echeveria':
        return 'Every 2-3 weeks';
      case 'Haworthia':
        return 'Every 2-3 weeks';
      case 'Burro\'s Tail':
        return 'Every 2-3 weeks';
      case 'String of Pearls':
        return 'Every 2-3 weeks';
      case 'Agave':
        return 'Every 3-4 weeks';

      case 'Sunflower':
        return 'Every 2-3 days';
      case 'Lavender':
        return 'Every 1-2 weeks';
      case 'Basil':
        return 'Every 2-3 days';
      case 'Rose':
        return 'Every 3-4 days';
      case 'Hibiscus':
        return 'Every 3-4 days';
      case 'Jasmine':
        return 'Every 3-4 days';
      case 'Mint':
        return 'Every 2-3 days';
      case 'Tomato Plant':
        return 'Every 2-3 days';
      case 'Marigold':
        return 'Every 3-4 days';
      case 'Bougainvillea':
        return 'Every 5-7 days';

      case 'Lily':
        return 'Every 3-4 days';
      case 'Daisy':
        return 'Every 3-4 days';
      case 'Tulip':
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
      case 'Calathea':
        return 'Indirect light';
      case 'Snake Plant':
      case 'ZZ Plant':
        return 'Low to bright light';
      case 'Orchid':
        return 'Indirect light';
      case 'Spider Plant':
      case 'Pothos':
      case 'Rubber Plant':
        return 'Bright indirect light';

      case 'Aloe Vera':
      case 'Cactus':
      case 'Jade Plant':
      case 'Echeveria':
      case 'Haworthia':
      case 'Burro\'s Tail':
      case 'String of Pearls':
      case 'Agave':
        return 'Bright direct light';

      case 'Sunflower':
      case 'Rose':
      case 'Hibiscus':
      case 'Jasmine':
      case 'Marigold':
      case 'Bougainvillea':
      case 'Basil':
      case 'Tomato Plant':
      case 'Lavender':
        return 'Full sun';
      case 'Mint':
        return 'Partial shade';

      case 'Lily':
      case 'Daisy':
      case 'Tulip':
        return 'Full sun to partial shade';

      default:
        return 'Indirect light';
    }
  }

  String _getDifficultyInfo(String plantName) {
    switch (plantName) {
      case 'Snake Plant':
      case 'ZZ Plant':
      case 'Pothos':
      case 'Aloe Vera':
      case 'Cactus':
      case 'Jade Plant':
      case 'Spider Plant':
      case 'Mint':
      case 'Basil':
        return 'Very Easy';

      case 'Monstera':
      case 'Peace Lily':
      case 'Rubber Plant':
      case 'Sunflower':
      case 'Marigold':
      case 'Daisy':
      case 'Tomato Plant':
      case 'Lavender':
      case 'Echeveria':
      case 'Haworthia':
        return 'Easy';

      case 'Fern':
      case 'Orchid':
      case 'Calathea':
      case 'Rose':
      case 'Hibiscus':
      case 'Jasmine':
      case 'Bougainvillea':
      case 'Lily':
      case 'Tulip':
      case 'String of Pearls':
      case 'Burro\'s Tail':
      case 'Agave':
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
