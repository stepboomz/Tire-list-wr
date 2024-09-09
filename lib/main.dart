import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:html' as html;
import 'dart:ui';
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
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF15202B),
        appBarTheme: AppBarTheme(
          color: Color(0xFF1B2836),
        ),
      ),
      themeMode: ThemeMode.dark,
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
    'mordekaiser',
    'maokai',
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
    'viego',
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
    'maokai': 'Jungle',
    'mordekaiser': 'Top',
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
    'viego': 'Jungle',
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

      // Convert the image to Image object to add watermark
      ui.Image originalImage = await boundary.toImage(pixelRatio: 3.0);
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);

      // Draw the original image onto the canvas
      canvas.drawImage(originalImage, Offset.zero, Paint());

      // Add watermark text "stepboomz"
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Developer : stepboomz',
          style: TextStyle(
            color: Colors.redAccent.withOpacity(0.5), // Adjust transparency
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      // Draw the text on the bottom right corner
      textPainter.paint(
        canvas,
        Offset(originalImage.width - textPainter.width - 20,
            originalImage.height - textPainter.height - 20),
      );

      // Convert the canvas to an image
      final ui.Picture picture = recorder.endRecording();
      final ui.Image watermarkedImage = await picture.toImage(
        originalImage.width,
        originalImage.height,
      );

      // Convert the watermarked image to bytes
      ByteData? watermarkedByteData =
          await watermarkedImage.toByteData(format: ImageByteFormat.png);
      final Uint8List watermarkedPngBytes =
          watermarkedByteData!.buffer.asUint8List();

      // Save the image using html package
      final blob = html.Blob([watermarkedPngBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', 'tier_list_with_watermark.jpg')
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
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Wild Rift Tier List ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              TextSpan(
                text: 'Patch 5.2c',
                style: TextStyle(
                  backgroundColor: Colors.redAccent[400],
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
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
                key: _tierListRepaintKey,
                child: Container(
                  color: Color(0xFF15202B),
                  child: Column(
                    children: tierList.keys
                        .map((tier) => buildTierRow(
                              tier,
                              getTierDescription(
                                  tier), // ส่งคำอธิบายไปพร้อมกับ tier
                            ))
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

  String getTierDescription(String tier) {
    switch (tier) {
      case 'S':
        return 'แชมเปี้ยนที่ดีที่สุดในแพทช์นี้ เลือกได้สำหรับทุกตำแหน่ง';
      case 'A':
        return 'แชมเปี้ยนที่แข็งแกร่ง สามารถเลือกเล่นได้บ่อย แต่ไม่โดดเด่นเท่า S-tier';
      case 'B':
        return 'แชมเปี้ยนระดับกลาง สามารถใช้งานได้ในสถานการณ์ที่เหมาะสม';
      case 'C':
        return 'แชมเปี้ยนที่มีความสามารถต่ำกว่าค่าเฉลี่ย ใช้ได้ในบางสถานการณ์';
      case 'D':
        return 'ไม่แนะนำสำหรับการเล่นในระดับแข่งขัน';
      default:
        return 'ไม่สามารถระบุระดับได้';
    }
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
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.black, width: 1.0),
          // ),
          child: championImage(champion),
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
                fontSize: 10.0,
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
      // color: Colors.black,
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
        height: 80, // กำหนดความสูงของรูปภาพ (ให้เท่ากันเพื่อเป็นวงกลม)
        decoration: BoxDecoration(
          shape: BoxShape.circle, // ทำให้ Container เป็นวงกลม
          border: Border.all(
            color: Colors.transparent, // เพิ่มเส้นขอบ (ถ้าต้องการ)
            width: 3.0,
          ),
        ),
        clipBehavior: Clip.hardEdge, // ตัดรูปภาพส่วนเกินออกให้เป็นวงกลม
        child: Image.asset(
          'champs/${championName.toLowerCase()}.webp',
          fit: BoxFit.cover, // ทำให้ภาพเต็มพื้นที่ของ Container

          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error);
          },
        ),
      ),
    );
  }

  Widget buildTierRow(String tier, String description) {
    Color tierColor;

    switch (tier) {
      case 'S':
        tierColor = Colors.red[300]!;
        break;
      case 'A':
        tierColor = Colors.orange[300]!;
        break;
      case 'B':
        tierColor = Colors.yellow[300]!;
        break;
      case 'C':
        tierColor = Colors.green[300]!;
        break;
      case 'D':
        tierColor = Colors.blue[300]!;
        break;
      default:
        tierColor = Colors.grey[300]!;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3, // ส่วนนี้จะเป็นพื้นที่สำหรับแชมเปี้ยน
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // หัวข้อ tier
                  Container(
                    color: tierColor,
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
                    height: 100, // เพิ่มความสูงให้พื้นที่ใส่แชมเปี้ยนมากขึ้น
                    child: DragTarget<String>(
                      onWillAccept: (champion) {
                        return !tierList[tier]!.contains(champion);
                      },
                      onAccept: (champion) {
                        setState(() {
                          tierList[tier]!.add(champion);
                          championPool.remove(champion);
                          tierList.forEach((key, value) {
                            if (key != tier) {
                              value.remove(champion);
                            }
                          });
                        });
                      },
                      builder: (context, candidateData, rejectedData) =>
                          ListView(
                        scrollDirection: Axis.horizontal,
                        children: tierList[tier]!
                            .map((champion) => Draggable<String>(
                                  data: champion,
                                  feedback: Material(
                                    child: championImage(champion),
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
          ),
          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างส่วนแชมเปี้ยนและคำอธิบาย
          Expanded(
            flex: 1, // ส่วนนี้จะเป็นพื้นที่สำหรับคำอธิบาย
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10, // กำหนดความกว้างของวงกลม
                        height: 10, // กำหนดความสูงของวงกลม
                        decoration: BoxDecoration(
                          color: tierColor, // สีของวงกลม
                          shape: BoxShape.circle, // กำหนดให้เป็นวงกลม
                        ),
                      ),
                      SizedBox(width: 8), // เพิ่มระยะห่างระหว่างวงกลมและข้อความ
                      Text(
                        '$tier Tier', // เพิ่มหัวข้อ tier ที่อธิบายอยู่
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    description, // คำอธิบายที่เกี่ยวข้องกับ tier นี้
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white, // สีข้อความ
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
