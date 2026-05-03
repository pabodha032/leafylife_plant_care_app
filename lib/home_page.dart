import 'package:flutter/material.dart';
import 'plant_details_page.dart';
import 'my_garden_page.dart';
import 'favorites_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  String searchQuery = '';

  Map<String, bool> favorites = {};

  final List<String> categories = [
    'All',
    'Indoor',
    'Outdoor',
    'Succulents',
    'Flowering',
  ];

  final List<Map<String, dynamic>> allPlants = [
    // Indoor
    {
      'name': 'Monstera',
      'type': 'Indoor Plant',
      'categories': ['Indoor'],
    },
    {
      'name': 'Snake Plant',
      'type': 'Low Light',
      'categories': ['Indoor'],
    },
    {
      'name': 'Peace Lily',
      'type': 'Flowering',
      'categories': ['Indoor', 'Flowering'],
    },
    {
      'name': 'Fern',
      'type': 'Humidity Lover',
      'categories': ['Indoor'],
    },
    {
      'name': 'Orchid',
      'type': 'Flowering',
      'categories': ['Indoor', 'Flowering'],
    },
    {
      'name': 'Spider Plant',
      'type': 'Air Purifier',
      'categories': ['Indoor'],
    },
    {
      'name': 'Rubber Plant',
      'type': 'Tall Grower',
      'categories': ['Indoor'],
    },
    {
      'name': 'Pothos',
      'type': 'Trailing',
      'categories': ['Indoor'],
    },
    {
      'name': 'ZZ Plant',
      'type': 'Low Light',
      'categories': ['Indoor'],
    },
    {
      'name': 'Calathea',
      'type': 'Prayer Plant',
      'categories': ['Indoor'],
    },

    // Succulents
    {
      'name': 'Aloe Vera',
      'type': 'Medicinal',
      'categories': ['Succulents'],
    },
    {
      'name': 'Cactus',
      'type': 'Desert Plant',
      'categories': ['Succulents', 'Outdoor'],
    },
    {
      'name': 'Jade Plant',
      'type': 'Money Plant',
      'categories': ['Succulents'],
    },
    {
      'name': 'Echeveria',
      'type': 'Rosette Shape',
      'categories': ['Succulents'],
    },
    {
      'name': 'Haworthia',
      'type': 'Zebra Plant',
      'categories': ['Succulents'],
    },
    {
      'name': 'Burro\'s Tail',
      'type': 'Trailing',
      'categories': ['Succulents'],
    },
    {
      'name': 'String of Pearls',
      'type': 'Hanging',
      'categories': ['Succulents'],
    },
    {
      'name': 'Agave',
      'type': 'Desert Plant',
      'categories': ['Succulents', 'Outdoor'],
    },

    // Outdoor
    {
      'name': 'Sunflower',
      'type': 'Tall Flower',
      'categories': ['Outdoor', 'Flowering'],
    },
    {
      'name': 'Lavender',
      'type': 'Aromatic',
      'categories': ['Outdoor'],
    },
    {
      'name': 'Basil',
      'type': 'Herb',
      'categories': ['Outdoor'],
    },
    {
      'name': 'Rose',
      'type': 'Flowering',
      'categories': ['Outdoor', 'Flowering'],
    },
    {
      'name': 'Hibiscus',
      'type': 'Tropical',
      'categories': ['Outdoor', 'Flowering'],
    },
    {
      'name': 'Jasmine',
      'type': 'Fragrant',
      'categories': ['Outdoor', 'Flowering'],
    },
    {
      'name': 'Mint',
      'type': 'Herb',
      'categories': ['Outdoor'],
    },
    {
      'name': 'Tomato Plant',
      'type': 'Vegetable',
      'categories': ['Outdoor'],
    },
    {
      'name': 'Marigold',
      'type': 'Annual Flower',
      'categories': ['Outdoor', 'Flowering'],
    },
    {
      'name': 'Bougainvillea',
      'type': 'Climbing',
      'categories': ['Outdoor'],
    },

    // Flowering
    {
      'name': 'Lily',
      'type': 'Elegant',
      'categories': ['Flowering'],
    },
    {
      'name': 'Daisy',
      'type': 'Cheerful',
      'categories': ['Flowering'],
    },
    {
      'name': 'Tulip',
      'type': 'Spring Flower',
      'categories': ['Flowering'],
    },
  ];

  List<Map<String, dynamic>> get filteredPlants {
    List<Map<String, dynamic>> result = allPlants;

    if (selectedCategory != 'All') {
      result = result.where((plant) {
        List<String> categories = List<String>.from(plant['categories']);
        return categories.contains(selectedCategory);
      }).toList();
    }

    if (searchQuery.isNotEmpty) {
      result = result.where((plant) {
        return plant['name']!.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    return result;
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
      case 'Burro\'s Tail':
        return 'assets/burros.png';
      case 'String of Pearls':
        return 'assets/pearls.png';
      case 'Agave':
        return 'assets/agave.png';
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
      case 'Bougainvillea':
        return 'assets/bougainvillea.png';
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

  List<String> _getCareTips(String plantName) {
    switch (plantName) {
      case 'Monstera':
        return [
          'Provide bright indirect light',
          'Water when top 2 inches of soil are dry',
          'Use a well-draining potting mix',
          'Wipe leaves with damp cloth to remove dust',
          'Provide a moss pole for climbing',
        ];
      case 'Snake Plant':
        return [
          'Tolerates low light conditions',
          'Allow soil to dry completely between waterings',
          'Avoid overwatering - causes root rot',
          'Clean leaves with damp cloth',
          'Fertilize once in spring and summer',
        ];
      case 'Peace Lily':
        return [
          'Water when leaves start to droop',
          'Prefers indirect light',
          'Keep away from direct sunlight',
          'Mist leaves occasionally',
          'Remove yellow leaves regularly',
        ];
      case 'Aloe Vera':
        return [
          'Needs bright direct sunlight',
          'Water deeply but infrequently',
          'Use cactus/succulent potting mix',
          'Allow soil to dry completely before watering',
          'Harvest outer leaves first for gel',
        ];
      case 'Cactus':
        return [
          'Needs full sun exposure',
          'Water very sparingly - every 3-4 weeks',
          'Use sandy, well-draining soil',
          'Protect from frost in winter',
          'Do not overwater - causes rot',
        ];
      case 'Fern':
        return [
          'Loves high humidity',
          'Keep soil consistently moist',
          'Mist leaves daily',
          'Prefers indirect light',
          'Trim dead fronds regularly',
        ];
      case 'Rose':
        return [
          'Needs 6+ hours of direct sunlight',
          'Water deeply at the base (not leaves)',
          'Prune in late winter or early spring',
          'Fertilize regularly during growing season',
          'Mulch around base to retain moisture',
        ];
      case 'Lavender':
        return [
          'Needs full sun exposure',
          'Well-draining soil is essential',
          'Water deeply but infrequently',
          'Prune after flowering',
          'Good air circulation prevents disease',
        ];
      case 'Sunflower':
        return [
          'Plant in full sun',
          'Water regularly but allow soil to dry',
          'Protect from strong winds',
          'Remove dead flowers for more blooms',
          'Support tall varieties with stakes',
        ];
      case 'Orchid':
        return [
          'Use bark-based potting mix',
          'Water once a week (let roots dry between)',
          'Provide bright indirect light',
          'Mist leaves regularly',
          'Fertilize weekly with orchid fertilizer',
        ];
      default:
        return [
          'Water when soil feels dry',
          'Provide adequate sunlight',
          'Use well-draining soil',
          'Remove dead leaves regularly',
          'Fertilize during growing season',
        ];
    }
  }

  String _getWateringInfo(String plantName) {
    switch (plantName) {
      case 'Monstera':
      case 'Rubber Plant':
        return 'Every 7-10 days';
      case 'Snake Plant':
      case 'ZZ Plant':
        return 'Every 2-3 weeks';
      case 'Peace Lily':
      case 'Calathea':
        return 'Every 5-7 days';
      case 'Fern':
        return 'Every 3-4 days';
      case 'Orchid':
        return 'Every 5-7 days';
      case 'Spider Plant':
      case 'Pothos':
        return 'Every 7-10 days';
      case 'Aloe Vera':
      case 'Jade Plant':
      case 'Echeveria':
      case 'Haworthia':
      case 'Burro\'s Tail':
      case 'String of Pearls':
      case 'Agave':
        return 'Every 2-3 weeks';
      case 'Cactus':
        return 'Every 3-4 weeks';
      case 'Sunflower':
      case 'Basil':
      case 'Tomato Plant':
        return 'Every 2-3 days';
      case 'Lavender':
        return 'Every 1-2 weeks';
      case 'Rose':
      case 'Hibiscus':
      case 'Jasmine':
        return 'Every 3-4 days';
      case 'Mint':
        return 'Every 2-3 days';
      case 'Marigold':
      case 'Bougainvillea':
        return 'Every 4-5 days';
      case 'Lily':
      case 'Daisy':
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
      case 'Jade Plant':
      case 'Echeveria':
      case 'Haworthia':
      case 'Burro\'s Tail':
      case 'String of Pearls':
      case 'Agave':
      case 'Cactus':
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

  String _getTemperatureInfo(String plantName) {
    return '18-27°C';
  }

  String _getDifficultyInfo(String plantName) {
    switch (plantName) {
      case 'Snake Plant':
      case 'ZZ Plant':
      case 'Pothos':
      case 'Aloe Vera':
      case 'Cactus':
      case 'Jade Plant':
        return 'Very Easy';
      case 'Monstera':
      case 'Spider Plant':
      case 'Rubber Plant':
      case 'Peace Lily':
      case 'Basil':
      case 'Mint':
      case 'Sunflower':
        return 'Easy';
      case 'Orchid':
      case 'Calathea':
      case 'Fern':
      case 'Rose':
      case 'Jasmine':
        return 'Moderate';
      default:
        return 'Easy';
    }
  }

  String _getDescription(String plantName) {
    switch (plantName) {
      case 'Monstera':
        return 'Swiss Cheese Plant is a popular tropical plant known for its unique holey leaves. It adds a touch of jungle vibe to any room.';
      case 'Snake Plant':
        return 'Snake Plant is one of the hardest plants to kill. It purifies air and thrives on neglect, perfect for busy people.';
      case 'Peace Lily':
        return 'Peace Lily produces beautiful white flowers and tells you when it needs water by drooping dramatically.';
      case 'Aloe Vera':
        return 'Aloe Vera is a medicinal plant. The gel inside its leaves can be used to treat minor burns and skin irritations.';
      case 'Fern':
        return 'Ferns love humidity. They look great in hanging baskets and bathrooms where the air is moist.';
      case 'Cactus':
        return 'Cacti are desert plants that store water in their stems. They need very little care and lots of sun.';
      case 'Rose':
        return 'Roses are classic beautiful flowers that come in many colors. They need regular care and love sunlight.';
      case 'Lavender':
        return 'Lavender is known for its calming scent and beautiful purple flowers. It loves full sun and well-drained soil.';
      case 'Sunflower':
        return 'Sunflowers are tall, cheerful flowers that follow the sun. They are easy to grow and attract butterflies.';
      case 'Orchid':
        return 'Orchids are exotic flowers that bloom for months. They need special care but reward with stunning beauty.';
      default:
        return 'A beautiful plant that will brighten your space.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'LeafyLife',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4CAF50),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/image12.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Plant Lover! 🌱',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Discover new plants and care tips today',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search plants...',
                    prefixIcon: Icon(Icons.search, color: Color(0xFF4CAF50)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Categories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: FilterChip(
                      label: Text(categories[index]),
                      selected: selectedCategory == categories[index],
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = categories[index];
                          searchQuery = '';
                        });
                      },
                      selectedColor: const Color(0xFF4CAF50),
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedCategory == categories[index]
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Plants',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${filteredPlants.length} plants',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            filteredPlants.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            searchQuery.isEmpty
                                ? 'No plants found in "$selectedCategory"'
                                : 'No results for "$searchQuery"',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (searchQuery.isNotEmpty)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  searchQuery = '';
                                });
                              },
                              child: const Text('Clear Search'),
                            ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.65,
                      children: filteredPlants.map((plant) {
                        return _buildPlantCard(plant['name']!, plant['type']!);
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home, color: Color(0xFF4CAF50), size: 28),
                const SizedBox(height: 4),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF4CAF50),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyGardenPage()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grass, color: Color(0xFF4CAF50), size: 28),
                  const SizedBox(height: 4),
                  Text(
                    'My Garden',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF4CAF50),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesPage(favorites: favorites),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Color(0xFF4CAF50),
                    size: 28,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Favorites',
                    style: TextStyle(fontSize: 12, color: Color(0xFF4CAF50)),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Color(0xFF4CAF50),
                    size: 28,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 12, color: Color(0xFF4CAF50)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantCard(String name, String type) {
    if (!favorites.containsKey(name)) {
      favorites[name] = false;
    }

    bool isFav = favorites[name] ?? false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    _getPlantImage(name),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.eco,
                          size: 50,
                          color: const Color(0xFF4CAF50).withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      favorites[name] = !isFav;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantDetailsPage(
                            plantName: name,
                            plantType: type,
                            watering: _getWateringInfo(name),
                            sunlight: _getSunlightInfo(name),
                            temperature: _getTemperatureInfo(name),
                            difficulty: _getDifficultyInfo(name),
                            description: _getDescription(name),
                            imageAsset: _getPlantImage(name),
                            careTips: _getCareTips(name),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Learn More',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
