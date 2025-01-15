import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  final List<Map<String, String>> apps = const [
    {
      'name': 'Upaisa',
      'description':
      'A branchless banking application developed in Swift 5. Features encryption techniques and protection using IXguard. Send and receive money and more functionalities.',
      'link': 'https://apps.apple.com/us/app/upaisa/id153673465',
    },
    {
      'name': 'FAMS Corporate Car Sharing',
      'description':
      'A car-sharing app for a private organization in Dubai, developed in Swift 5. Features car tracking, remote controls for lock/unlock, and accident tracking.',
      'link':
      'https://apps.apple.com/us/app/fams-corporate-car-sharing/id1524627372',
    },
    {
      'name': 'HNO Shareholder Portal',
      'description':
      'An app for HNO shareholders to buy and sell shares, developed entirely in Swift 5.',
      'link':
      'https://apps.apple.com/us/app/hno-shareholder-portal/id1538412452',
    },
    {
      'name': 'Turbo VPN',
      'description':
      'A VPN application developed in Flutter. Connect to different countries and features in-app purchases and subscription modules.',
      'link':
      'https://play.google.com/store/apps/details?id=com.wivro.free.turbo.vpn',
    },
    {
      'name': 'Sipay',
      'description':
      'A versatile payment app for seamless and secure financial transactions with a user-friendly interface.',
      'link':
      'https://play.google.com/store/apps/details?id=com.app.sipay&hl=en&gl=US',
    },
    {
      'name': 'Swizio',
      'description':
      'An event management app that simplifies organization and engagement for various events.',
      'link':
      'https://play.google.com/store/apps/details?id=com.swizio.application&hl=en&gl=US',
    },
    {
      'name': 'Islam Pro',
      'description':
      'A comprehensive Islamic app offering prayer times, Quranic verses, and teachings.',
      'link':
      'https://play.google.com/store/apps/details?id=com.hyxio.islamMuslim.pro',
    },
  ];

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hi, I am Muhammad Zeeshan Ashraf, a mobile app developer with over 8 years of experience specializing in iOS, Flutter, and React Native development. Here are some of the apps I have developed.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: apps.map((app) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        app['name']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: apps.length,
              itemBuilder: (context, index) {
                final app = apps[index];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          app['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          app['description']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () => _launchURL(app['link']!),
                          child: const Text('View App'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
