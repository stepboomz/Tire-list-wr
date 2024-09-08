import 'dart:typed_data';
import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TierListPage(),
    );
  }
}

class TierListPage extends StatefulWidget {
  @override
  _TierListPageState createState() => _TierListPageState();
}

class _TierListPageState extends State<TierListPage> {
  GlobalKey _tierListRepaintKey = GlobalKey(); // GlobalKey for tier list
  List<String> championPool = [
    'aatrox',
    'ahri',
    'akali',
    'akshan',
    'alistar',
    'amumu',
    'annie',
    'ashe',
    'aurelion-sol',
    'blitzcrank',
    'brand',
    'braum',
    'Caitlyn',
    'camille',
    'Corki',
    'darius',
    'diana',
    'dr-mundo',
    'draven',
    'ekko',
    'evelynn',
    'Ezreal',
    'fiddlesticks',
    'fiora',
    'fizz',
    'galio',
    'garen',
    'gragas',
    'graves',
    'gwen',
    'hecarim',
    'irelia',
    'janna',
    'jarvan-iv',
    'jax',
    'jayce',
    'jhin',
    'jinx',
    'kaisa',
    'karma',
    'kassadin',
    'katarina',
    'kayle',
    'kayn',
    'kennen',
    'khazix',
    'kindred',
    'lee-sin',
    'leona',
    'lillia',
    'lucian',
    'lulu',
    'lux',
    'malphite',
    'master-yi',
    'miss-fortune',
    'morgana',
    'nami',
    'nasus',
    'nautilus',
    'nilah',
    'nunu-and-willump',
    'olaf',
    'orianna',
    'ornn',
    'pantheon',
    'pyke',
    'rakan',
    'rammus',
    'renekton',
    'rengar',
    'riven',
    'samira',
    'senna',
    'seraphine',
    'sett',
    'shen',
    'shyvana',
    'singed',
    'sion',
    'sivir',
    'sona',
    'soraka',
    'swain',
    'syndra',
    'talon',
    'teemo',
    'thresh',
    'tristana',
    'tryndamere',
    'twisted-fate',
    'twitch',
    'urgot',
    'varus',
    'vayne',
    'veigar',
    'vex',
    'vi',
    'vladimir',
    'volibear',
    'warwick',
    'wukong',
    'xayah',
    'xin-zhao',
    'yasuo',
    'yone',
    'yuumi',
    'zed',
    'zeri',
    'ziggs',
    'zoe',
    'zyra'
  ];

  Map<String, List<String>> tierList = {
    'S+': [],
    'S': [],
    'A': [],
    'B': [],
    'C': []
  };

  void resetTierList() {
    setState(() {
      tierList.forEach((key, value) => value.clear());
      List<String> championPool = [
        'aatrox',
        'ahri',
        'akali',
        'akshan',
        'alistar',
        'amumu',
        'annie',
        'ashe',
        'aurelion-sol',
        'blitzcrank',
        'brand',
        'braum',
        'Caitlyn',
        'camille',
        'Corki',
        'darius',
        'diana',
        'dr-mundo',
        'draven',
        'ekko',
        'evelynn',
        'Ezreal',
        'fiddlesticks',
        'fiora',
        'fizz',
        'galio',
        'garen',
        'gragas',
        'graves',
        'gwen',
        'hecarim',
        'irelia',
        'janna',
        'jarvan-iv',
        'jax',
        'jayce',
        'jhin',
        'jinx',
        'kaisa',
        'karma',
        'kassadin',
        'katarina',
        'kayle',
        'kayn',
        'kennen',
        'khazix',
        'kindred',
        'lee-sin',
        'leona',
        'lillia',
        'lucian',
        'lulu',
        'lux',
        'malphite',
        'master-yi',
        'miss-fortune',
        'morgana',
        'nami',
        'nasus',
        'nautilus',
        'nilah',
        'nunu-and-willump',
        'olaf',
        'orianna',
        'ornn',
        'pantheon',
        'pyke',
        'rakan',
        'rammus',
        'renekton',
        'rengar',
        'riven',
        'samira',
        'senna',
        'seraphine',
        'sett',
        'shen',
        'shyvana',
        'singed',
        'sion',
        'sivir',
        'sona',
        'soraka',
        'swain',
        'syndra',
        'talon',
        'teemo',
        'thresh',
        'tristana',
        'tryndamere',
        'twisted-fate',
        'twitch',
        'urgot',
        'varus',
        'vayne',
        'veigar',
        'vex',
        'vi',
        'vladimir',
        'volibear',
        'warwick',
        'wukong',
        'xayah',
        'xin-zhao',
        'yasuo',
        'yone',
        'yuumi',
        'zed',
        'zeri',
        'ziggs',
        'zoe',
        'zyra'
      ];
    });
  }

  Future<void> _captureAndSaveTierListImage() async {
    try {
      RenderRepaintBoundary boundary = _tierListRepaintKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;

      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image using html package
      final blob = html.Blob([pngBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', 'tier_list.png')
        ..click();
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print('Error capturing image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error capturing image: $e')),
      );
    }
  }

  void _moveToPool(String champion) {
    setState(() {
      // Move champion from tierList to championPool
      tierList.forEach((key, value) {
        if (value.contains(champion)) {
          value.remove(champion);
          championPool.add(champion);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tier List'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetTierList, // Reset button
            tooltip: 'Reset Tier List',
          ),
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed:
                _captureAndSaveTierListImage, // Save only tier list image
            tooltip: 'Save Tier List Image',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildChampionPool(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: RepaintBoundary(
                key:
                    _tierListRepaintKey, // Use this key for the tier list section
                child: Container(
                  child: Column(
                    children: tierList.keys
                        .map((tier) => buildTierRow(tier))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChampionPool() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 15,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemCount: championPool.length,
              itemBuilder: (context, index) {
                String champion = championPool[index];
                return Draggable<String>(
                  data: champion,
                  feedback: Material(
                    child: Container(
                      child: championImage(champion),
                    ),
                  ),
                  childWhenDragging: Container(),
                  child: championImage(champion),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget championImage(String championName) {
    return GestureDetector(
      onTap: () {
        _moveToPool(championName);
      },
      child: Image.asset(
        'champs/${championName.toLowerCase()}.webp',
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error);
        },
      ),
    );
  }

  Widget buildTierRow(String tier) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // Grey border for the entire tier row
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0), // Optional: Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tier Header Inside the Border
            Container(
              color: Colors.red, // Red background for tier headers
              padding: const EdgeInsets.all(8.0),
              width: double.infinity, // Ensure header stretches full width
              child: Text(
                tier,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Area to Place Champions
            Container(
              height: 70,
              child: DragTarget<String>(
                onWillAccept: (champion) {
                  return !tierList[tier]!.contains(champion);
                },
                onAccept: (champion) {
                  setState(() {
                    tierList[tier]!.add(champion);
                    championPool.remove(champion);
                    // Remove from other tiers
                    tierList.forEach((key, value) {
                      if (key != tier) {
                        value.remove(champion);
                      }
                    });
                  });
                },
                builder: (context, candidateData, rejectedData) => ListView(
                  scrollDirection: Axis.horizontal,
                  children: tierList[tier]!
                      .map((champion) => Draggable<String>(
                            data: champion,
                            feedback: Material(
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                color: Colors.red, // Color when dragging
                                child: championImage(champion),
                              ),
                            ),
                            childWhenDragging: Container(),
                            child: championImage(champion),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
