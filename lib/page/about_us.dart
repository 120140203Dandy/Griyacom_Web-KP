import 'package:flutter/material.dart';
import '/main.dart'; // Import halaman Main untuk navigasi

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Our Story',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nunc ullamcorper neque diam, vel luctus dolor congue ut. Integer mattis dictum libero eu volutpat. Cras cursus ligula sem, eu malesuada nulla tincidunt quis. Sed dignissim, orci a blandit fringilla, nunc diam lacinia mi, non pharetra quam justo quis urna. Integer tristique, ante nec gravida sollicitudin, ligula ligula auctor libero, in vehicula augue nulla sed nisl.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
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
              image: AssetImage('assets/images/header_aboutus.png'),
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
                        'About Us',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Learn more about us',
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
}
