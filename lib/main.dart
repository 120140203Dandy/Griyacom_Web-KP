import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'page/about_us.dart'; // Import halaman About Us
import 'page/contact.dart'; // Import halaman Contact

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Griyacom',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
      routes: {
        '/about': (context) => AboutUsPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/slideshow_pic1.png',
    'assets/images/slideshow_pic2.png',
    'assets/images/slideshow_pic3.png',
  ];

  final List<Map<String, String>> _features = [
    {
      'title': 'Chat With Technician',
      'subtitle': 'Nunc ullamcorper neque diam, vel luctus dolor congue ut.',
      'imagePath': 'assets/images/feature1.png',
    },
    {
      'title': 'Our Services',
      'subtitle': 'Nunc ullamcorper neque diam, vel luctus dolor congue ut.',
      'imagePath': 'assets/images/feature2.png',
    },
    {
      'title': 'Video Explainer',
      'subtitle': 'Nunc ullamcorper neque diam, vel luctus dolor congue ut.',
      'imagePath': 'assets/images/feature3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double maxWidth = constraints.maxWidth;
                      int numColumns = (maxWidth ~/ 300).clamp(1, 3);
                      double boxWidth = (maxWidth - (20 * (numColumns - 1))) / numColumns;

                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 20,
                        runSpacing: 20,
                        children: _features.map((feature) {
                          return _buildFeatureBox(
                            title: feature['title']!,
                            subtitle: feature['subtitle']!,
                            imagePath: feature['imagePath']!,
                            width: boxWidth,
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: _images.length * 2,
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      viewportFraction: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index % _images.length;
                        });
                      },
                    ),
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          _images[itemIndex % _images.length],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/header_background.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
        ),
        Container(
          height: 400,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                    child: Text(
                      'Griyacom',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (MediaQuery.of(context).size.width > 600)
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/about');
                          },
                          child: Text('About', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/contact');
                          },
                          child: Text('Contact', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Services', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Articles', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    )
                  else
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'About') {
                          Navigator.pushNamed(context, '/about');
                        } else if (value == 'Contact') {
                          Navigator.pushNamed(context, '/contact');
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: 'About',
                            child: Text('About'),
                          ),
                          PopupMenuItem(
                            value: 'Contact',
                            child: Text('Contact'),
                          ),
                          PopupMenuItem(
                            value: 'Services',
                            child: Text('Services'),
                          ),
                          PopupMenuItem(
                            value: 'Articles',
                            child: Text('Articles'),
                          ),
                        ];
                      },
                      child: Icon(Icons.menu, color: Colors.white),
                    ),
                ],
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [Color(0xFFFFD6FF), Color(0xFFBBD0FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcIn,
                      child: Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ini teks bisa di edit',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: Color(0xFF1D1D1F),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Link',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact'); // Navigasi ke halaman contact
                },
                child: Text(
                  'Contact',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Service',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Image.asset('assets/images/instagram.png'),
                iconSize: 40,
                onPressed: () {
                  // Action when Instagram icon is clicked
                },
              ),
              IconButton(
                icon: Image.asset('assets/images/whatsapp.png'),
                iconSize: 40,
                onPressed: () {
                  // Action when WhatsApp icon is clicked
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureBox({required String title, required String subtitle, required String imagePath, required double width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 100, fit: BoxFit.contain),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
