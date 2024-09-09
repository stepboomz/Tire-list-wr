import 'dart:typed_data';
import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

import 'rold.dart';

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
  String selectedRole = 'All';
  Map<String, String> championRoles = {
    'aatrox': 'Top',
    'ahri': 'Mid',
    'akali': 'Mid',
    'akshan': 'Mid',
    'alistar': 'Support',
    'amumu': 'Jungle',
    'annie': 'Mid',
    'ashe': 'ADC',
    'aurelion-sol': 'Mid',
    'blitzcrank': 'Support',
    'brand': 'Support',
    'braum': 'Support',
    'Caitlyn': 'ADC',
    'camille': 'Top',
    'Corki': 'Mid',
    'darius': 'Top',
    'diana': 'Jungle',
    'dr-mundo': 'Top',
    'draven': 'ADC',
    'ekko': 'Mid',
    'evelynn': 'Jungle',
    'Ezreal': 'ADC',
    'fiddlesticks': 'Jungle',
    'fiora': 'Top',
    'fizz': 'Mid',
    'galio': 'Mid',
    'garen': 'Top',
    'gragas': 'Top',
    'graves': 'Jungle',
    'gwen': 'Top',
    'hecarim': 'Jungle',
    'irelia': 'Top',
    'janna': 'Support',
    'jarvan-iv': 'Jungle',
    'jax': 'Top',
    'jayce': 'Top',
    'jhin': 'ADC',
    'jinx': 'ADC',
    'kaisa': 'ADC',
    'karma': 'Support',
    'kassadin': 'Mid',
    'katarina': 'Mid',
    'kayle': 'Top',
    'kayn': 'Jungle',
    'kennen': 'Top',
    'khazix': 'Jungle',
    'kindred': 'Jungle',
    'lee-sin': 'Jungle',
    'leona': 'Support',
    'lillia': 'Jungle',
    'lucian': 'ADC',
    'lulu': 'Support',
    'lux': 'Support',
    'malphite': 'Top',
    'master-yi': 'Jungle',
    'miss-fortune': 'ADC',
    'morgana': 'Support',
    'nami': 'Support',
    'nasus': 'Top',
    'nautilus': 'Support',
    'nilah': 'ADC',
    'nunu-and-willump': 'Jungle',
    'olaf': 'Top',
    'orianna': 'Mid',
    'ornn': 'Top',
    'pantheon': 'Top',
    'pyke': 'Support',
    'rakan': 'Support',
    'rammus': 'Jungle',
    'renekton': 'Top',
    'rengar': 'Jungle',
    'riven': 'Top',
    'samira': 'ADC',
    'senna': 'Support',
    'seraphine': 'Support',
    'sett': 'Top',
    'shen': 'Top',
    'shyvana': 'Jungle',
    'singed': 'Top',
    'sion': 'Top',
    'sivir': 'ADC',
    'sona': 'Support',
    'soraka': 'Support',
    'swain': 'Mid',
    'syndra': 'Mid',
    'talon': 'Mid',
    'teemo': 'Top',
    'thresh': 'Support',
    'tristana': 'ADC',
    'tryndamere': 'Top',
    'twisted-fate': 'Mid',
    'twitch': 'ADC',
    'urgot': 'Top',
    'varus': 'ADC',
    'vayne': 'ADC',
    'veigar': 'Mid',
    'vex': 'Mid',
    'vi': 'Jungle',
    'vladimir': 'Mid',
    'volibear': 'Top',
    'warwick': 'Jungle',
    'wukong': 'Top',
    'xayah': 'ADC',
    'xin-zhao': 'Jungle',
    'yasuo': 'Mid',
    'yone': 'Mid',
    'yuumi': 'Support',
    'zed': 'Mid',
    'zeri': 'ADC',
    'ziggs': 'Mid',
    'zoe': 'Mid',
    'zyra': 'Support'
  };

  Map<String, List<String>> tierList = {
    'S': [],
    'A': [],
    'B': [],
    'C': [],
    'D': []
  };

  void saveTierListState() {
    // Convert the tierList and championPool to JSON
    final tierListJson = jsonEncode({
      'tierList':
          tierList.map((key, value) => MapEntry(key, List<String>.from(value))),
      'championPool': championPool,
    });

    // Store in localStorage
    html.window.localStorage['tierListState'] = tierListJson;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tier list saved!')),
    );
  }

  void loadTierListState() {
    // Get the stored state from localStorage
    final storedData = html.window.localStorage['tierListState'];

    if (storedData != null) {
      // Parse the stored JSON data and set the tierList and championPool
      setState(() {
        final parsedData = jsonDecode(storedData);

        // Parse tierList properly
        final loadedTierList =
            Map<String, dynamic>.from(parsedData['tierList']);

        // Ensure each tier's value is correctly converted to List<String>
        tierList = loadedTierList
            .map((key, value) => MapEntry(key, List<String>.from(value)));

        // Convert championPool back to List<String>
        championPool = List<String>.from(parsedData['championPool']);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tier list loaded!')),
      );
    }
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
        title: Text('Tier List 5.2C'),
        actions: [
          IconButton(
            icon: Icon(Icons.image),
            onPressed:
                _captureAndSaveTierListImage, // Save only tier list image
            tooltip: 'Save Tier List Image',
          ),
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: saveTierListState, // Save tier list state
            tooltip: 'Save Tier List',
          ),
          IconButton(
            icon: Icon(Icons.folder_open),
            onPressed: loadTierListState, // Load tier list state
            tooltip: 'Load Tier List',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RoleSelectionWidget(
              selectedRole: selectedRole,
              onRoleSelected: (role) {
                setState(() {
                  selectedRole = role;
                });
              },
            ),
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

  List<String> filterChampionPoolByRole() {
    if (selectedRole == 'All') {
      return championPool;
    }
    return championPool
        .where((champion) => championRoles[champion] == selectedRole)
        .toList();
  }

  Widget championImageWithRole(String champion, String role) {
    return Stack(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
          ),
          child: championImage(
              champion), // The function that displays the champion image
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            color: Colors.black.withOpacity(0.7),
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            child: Text(
              champion,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildChampionPool() {
    List<String> filteredChampionPool = filterChampionPoolByRole();

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
              itemCount: filteredChampionPool.length,
              itemBuilder: (context, index) {
                String champion = filteredChampionPool[index];
                String role = championRoles[champion] ?? 'Unknown';

                return SizedBox(
                  width: 64,
                  height: 64,
                  child: Draggable<String>(
                    data: champion,
                    feedback: Material(
                      child: championImageWithRole(champion, role),
                    ),
                    childWhenDragging: Container(),
                    child: championImageWithRole(champion, role),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  // Widget championImage(String championName) {
  //   return GestureDetector(
  //     onTap: () {
  //       _moveToPool(championName);
  //     },
  //     child: Image.asset(
  //       'champs/${championName.toLowerCase()}.webp',
  //       // 'assets/${championName.toLowerCase()}.webp',
  //       errorBuilder: (context, error, stackTrace) {
  //         return Icon(Icons.error);
  //       },
  //     ),
  //   );
  // }

  Widget championImage(String championName) {
    return GestureDetector(
      onTap: () {
        _moveToPool(championName);
      },
      child: Container(
        width: 80, // กำหนดความกว้างของรูปภาพ
        height: 85, // กำหนดความสูงของรูปภาพ
        child: Image.asset(
          'champs/${championName.toLowerCase()}.webp',
          // 'assets/${championName.toLowerCase()}.webp',
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error);
          },
        ),
      ),
    );
  }

  Widget buildTierRow(String tier) {
    Color tierColor;

    switch (tier) {
      case 'S':
        tierColor = Colors.red[300]!; // สีแดงอ่อน
        break;
      case 'A':
        tierColor = Colors.orange[300]!; // สีส้มอ่อน
        break;
      case 'B':
        tierColor = Colors.yellow[300]!; // สีเหลืองอ่อน
        break;
      case 'C':
        tierColor = Colors.green[300]!; // สีเขียวอ่อน
        break;
      case 'D':
        tierColor = Colors.blue[300]!; // เพิ่มสีถ้า D
        break;
      default:
        tierColor = Colors.grey[300]!; // สีเริ่มต้น (เผื่อกรณีผิดพลาด)
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          // color: tierColor, // กำหนดสีพื้นหลังตาม tier
          border: Border.all(
            color: Colors.grey, // กรอบสีเทา
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0), // มุมโค้งมน
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // หัวข้อ tier
            Container(
              color: tierColor, // พื้นหลังสีแดงสำหรับหัวข้อ
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: Text(
                tier,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // ส่วนที่วางแชมเปี้ยน
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
                    // ลบออกจาก tier อื่น ๆ
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
                                color: Colors.red, // สีขณะลาก
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
