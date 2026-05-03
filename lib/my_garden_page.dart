import 'package:flutter/material.dart';
import 'plant_details_page.dart';

class GardenData {
  static List<Map<String, dynamic>> myGardenPlants = [];

  static void addPlant(Map<String, dynamic> plant) {
    myGardenPlants.add(plant);
  }

  static void removePlant(int index) {
    myGardenPlants.removeAt(index);
  }

  static void clearGarden() {
    myGardenPlants.clear();
  }

  static bool isPlantInGarden(String plantName) {
    return myGardenPlants.any((plant) => plant['name'] == plantName);
  }
}

class MyGardenPage extends StatefulWidget {
  const MyGardenPage({super.key});

  @override
  State<MyGardenPage> createState() => _MyGardenPageState();
}

class _MyGardenPageState extends State<MyGardenPage> {
  void _removePlant(int index) {
    setState(() {
      GardenData.removePlant(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Plant removed from your garden'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          'My Garden',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF4CAF50)),
            onPressed: () {
              _showAddPlantDialog(context);
            },
          ),
        ],
      ),

      body: GardenData.myGardenPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grass, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    'Your garden is empty',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the + button to add plants',
                    style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: GardenData.myGardenPlants.length,
              itemBuilder: (context, index) {
                final plant = GardenData.myGardenPlants[index];
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
                              plant['imageAsset'],
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
                                plant['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                plant['type'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 12,
                                    color: Colors.grey[500],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    plant['dateAdded'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
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
                                      size: 12,
                                      color: Colors.blue[600],
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      plant['waterStatus'],
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.blue[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.visibility,
                                  color: Color(0xFF4CAF50),
                                  size: 20,
                                ),
                                onPressed: () {
                                  _navigateToPlantDetails(plant['name']);
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                onPressed: () {
                                  _removePlant(index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _showAddPlantDialog(BuildContext context) {
    List<String> availablePlants = [
      'Monstera',
      'Snake Plant',
      'Peace Lily',
      'Fern',
      'Orchid',
      'Spider Plant',
      'Rubber Plant',
      'Pothos',
      'ZZ Plant',
      'Calathea',
      'Aloe Vera',
      'Cactus',
      'Jade Plant',
      'Echeveria',
      'Haworthia',
      'Sunflower',
      'Lavender',
      'Basil',
      'Rose',
      'Hibiscus',
      'Jasmine',
      'Mint',
      'Tomato Plant',
      'Marigold',
      'Lily',
      'Daisy',
      'Tulip',
    ];

    List<String> plantsToAdd = availablePlants.where((plant) {
      return !GardenData.isPlantInGarden(plant);
    }).toList();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Add Plant to Garden',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: plantsToAdd.isEmpty
            ? const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, size: 50, color: Colors.green),
                  SizedBox(height: 10),
                  Text('All plants are already in your garden!'),
                ],
              )
            : SizedBox(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: plantsToAdd.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.eco, color: Color(0xFF4CAF50)),
                      title: Text(plantsToAdd[index]),
                      onTap: () {
                        _addPlantToGarden(plantsToAdd[index]);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _addPlantToGarden(String plantName) {
    String plantType = _getPlantType(plantName);
    String imageAsset = _getPlantImage(plantName);

    setState(() {
      GardenData.addPlant({
        'name': plantName,
        'type': plantType,
        'dateAdded': 'Added on ${_getCurrentDate()}',
        'waterStatus': _getWaterStatus(plantName),
        'imageAsset': imageAsset,
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$plantName added to your garden!'),
        backgroundColor: const Color(0xFF4CAF50),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String _getPlantType(String plantName) {
    switch (plantName) {
      case 'Monstera':
      case 'Snake Plant':
      case 'Peace Lily':
      case 'Fern':
      case 'Orchid':
      case 'Spider Plant':
      case 'Rubber Plant':
      case 'Pothos':
      case 'ZZ Plant':
      case 'Calathea':
        return 'Indoor Plant';
      case 'Aloe Vera':
      case 'Cactus':
      case 'Jade Plant':
      case 'Echeveria':
      case 'Haworthia':
        return 'Succulent';
      case 'Sunflower':
      case 'Lavender':
      case 'Basil':
      case 'Rose':
      case 'Hibiscus':
      case 'Jasmine':
      case 'Mint':
      case 'Tomato Plant':
      case 'Marigold':
        return 'Outdoor Plant';
      case 'Lily':
      case 'Daisy':
      case 'Tulip':
        return 'Flowering Plant';
      default:
        return 'Plant';
    }
  }

  String _getPlantImage(String plantName) {
    switch (plantName) {
      case 'Monstera':
        return 'assets/monstera.png';
      case 'Snake Plant':
        return 'assets/snakeplant.png';
      case 'Peace Lily':
        return 'assets/image11.png';
      case 'Fern':
        return 'assets/image13.png';
      case 'Orchid':
        return 'assets/orchid.png';
      case 'Spider Plant':
        return 'assets/spider.png';
      case 'Rubber Plant':
        return 'assets/rubber.png';
      case 'Pothos':
        return 'assets/pothos.png';
      case 'ZZ Plant':
        return 'assets/zz.png';
      case 'Calathea':
        return 'assets/calathea.png';
      case 'Aloe Vera':
        return 'assets/image12.png';
      case 'Cactus':
        return 'assets/image1.jpg';
      case 'Jade Plant':
        return 'assets/jade.png';
      case 'Echeveria':
        return 'assets/echeveria.png';
      case 'Haworthia':
        return 'assets/haworthia.png';
      case 'Sunflower':
        return 'assets/sunflower.png';
      case 'Lavender':
        return 'assets/lavender.png';
      case 'Basil':
        return 'assets/basil.png';
      case 'Rose':
        return 'assets/rose.png';
      case 'Hibiscus':
        return 'assets/hibiscus.png';
      case 'Jasmine':
        return 'assets/jasmine.png';
      case 'Mint':
        return 'assets/mint.png';
      case 'Tomato Plant':
        return 'assets/tomato.png';
      case 'Marigold':
        return 'assets/marigold.png';
      case 'Lily':
        return 'assets/lily.png';
      case 'Daisy':
        return 'assets/daisy.png';
      case 'Tulip':
        return 'assets/tulip.png';
      default:
        return 'assets/image5.jpg';
    }
  }

  String _getWaterStatus(String plantName) {
    switch (plantName) {
      case 'Cactus':
        return 'Water in 2 weeks';
      case 'Snake Plant':
      case 'ZZ Plant':
        return 'Water in 10 days';
      case 'Monstera':
      case 'Peace Lily':
        return 'Water in 3 days';
      case 'Fern':
        return 'Water tomorrow';
      default:
        return 'Water in 5 days';
    }
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[now.month - 1]} ${now.day}, ${now.year}';
  }

  void _navigateToPlantDetails(String plantName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantDetailsPage(
          plantName: plantName,
          plantType: _getPlantType(plantName),
          watering: _getWateringInfo(plantName),
          sunlight: _getSunlightInfo(plantName),
          temperature: '18-27°C',
          difficulty: _getDifficultyInfo(plantName),
          description: _getDescription(plantName),
          imageAsset: _getPlantImage(plantName),
          careTips: _getCareTips(plantName),
        ),
      ),
    );
  }

  String _getWateringInfo(String plantName) {
    switch (plantName) {
      case 'Cactus':
        return 'Every 3-4 weeks';
      case 'Snake Plant':
        return 'Every 2-3 weeks';
      case 'Fern':
        return 'Every 3-4 days';
      default:
        return 'Every 7-10 days';
    }
  }

  String _getSunlightInfo(String plantName) {
    switch (plantName) {
      case 'Cactus':
        return 'Bright direct light';
      case 'Fern':
        return 'Indirect light';
      default:
        return 'Indirect to bright light';
    }
  }

  String _getDifficultyInfo(String plantName) {
    switch (plantName) {
      case 'Cactus':
      case 'Snake Plant':
        return 'Very Easy';
      case 'Fern':
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
      'Fertilize during growing season',
    ];
  }
}
