import 'package:flutter/material.dart';
import '/main.dart'; // Import halaman Main untuk navigasi
import 'package:url_launcher/url_launcher.dart'; // Pastikan package ini ditambahkan ke pubspec.yaml

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final String googleMapUrl =
      'https://www.google.com/maps?q=Jl.Teuku+Umar+No.55+Kedaton+Bandar+Lampung,+Bandar+Lampung';

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
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildContactForm(),
                  SizedBox(height: 40),
                  _buildMapSection(),
                ],
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email Address',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Subject',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            labelText: 'Message',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Handle send button press
            },
            child: Text('Send'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple, // background color
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapSection() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 200,
            child: GestureDetector(
              onTap: () async {
                Uri url = Uri.parse(googleMapUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $googleMapUrl';
                }
              },
              child: Image.network(
                'https://maps.googleapis.com/maps/api/staticmap?center=Jl.Teuku+Umar+No.55+Kedaton+Bandar+Lampung,+Bandar+Lampung&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C-6.921,107.606',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 1,
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
                  'Griyacom',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Alamat: Jl.Teuku Umar No.55 Kedaton Bandar Lampung, Bandar Lampung',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
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
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Get in touch with us',
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
