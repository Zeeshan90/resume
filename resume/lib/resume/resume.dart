import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume/app_routes.dart';
import 'package:resume/asset_constants.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10, // Light gray background for contrast
      body: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Dynamically calculate width based on screen size
              double pageWidth = constraints.maxWidth * 0.7;

              return Container(
                width: pageWidth,
                margin: const EdgeInsets.symmetric(vertical: 40),
                padding: const EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.8),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage(AssetConstants.profileImg),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Muhammad Zeeshan Ashraf',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            Text(
                              'Senior Mobile Application Developer',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    Divider(height: 40, thickness: 0.6),
                    _buildSectionTitle('Contact Information'),
                    _buildContactRow(
                        Icons.email, 'muhammadzeeshan1995@gmail.com'),
                    _buildContactRow(Icons.phone, '+92 302 4186671'),
                    _buildContactRow(Icons.location_on, 'Lahore, Pakistan'),
                    GestureDetector(
                      onTap: () {
                        print("hello");
                        Get.toNamed(AppRoutes.portfolio);
                      },
                      child: _buildContactRow(
                        Icons.link,
                        'https://www.linkedin.com/in/zeeshan-ashraf-68454a136',
                        isLink: true,
                      ),
                    ),
                    _buildContactRow(
                      Icons.link,
                      'https://github.com/Zeeshan90',
                      isLink: true,
                    ),
                    Divider(height: 40, thickness: 0.6),
                    _buildSectionTitle('Professional Summary'),
                    Text(
                      'Experienced Mobile Application Developer with over 5 years of success in designing and deploying secure, scalable applications on iOS, Android, and Flutter platforms. Proven track record of leading teams to deliver projects on time while optimizing performance by up to 40%.',
                    ),
                    Divider(height: 40, thickness: 0.6),
                    _buildSectionTitle('Core Competencies'),
                    _buildBulletedList([
                      'Programming: Swift, Kotlin, Dart',
                      'Frameworks: Xcode, Android Studio, UIKIT',
                      'Network APIs: Alamofire, Firebase Messaging',
                      'DevOps: CI/CD, App Store Deployment',
                      'Security: AES Encryption, IXGuard, Crashlytics',
                    ]),
                    Divider(height: 40, thickness: 0.6),
                    _buildSectionTitle('Professional Experience'),
                    _buildExperience(
                      title: 'Mobile Application Developer',
                      company: 'Stanntech',
                      date: 'November 2022 - Present',
                      responsibilities: [
                        'Developed and maintained cross-platform Flutter applications, achieving a 25% reduction in development time.',
                        'Collaborated with global teams, ensuring seamless feature integration.',
                        'Streamlined CI/CD pipelines, reducing deployment errors by 15%.',
                      ],
                    ),
                    _buildExperience(
                      title: 'Senior Consultant | iOS Developer',
                      company: 'Abacus Consulting, Lahore',
                      date: '2020 - November 2022',
                      responsibilities: [
                        'Implemented biometric authentication for high-security applications.',
                        'Mentored 5 junior developers, resulting in a 30% increase in team productivity.',
                        'Optimized memory usage, improving app performance by 20%.',
                      ],
                    ),
                    Divider(height: 40, thickness: 0.62),
                    _buildSectionTitle('Projects'),
                    _buildProject(
                      title: 'UPaisa - Branchless Banking Application',
                      description:
                          'A comprehensive mobile banking solution developed entirely in Swift 5, allowing users to send and receive money and perform secure financial transactions.',
                      link: 'https://apps.apple.com/us/app/upaisa/id153673465',
                    ),
                    _buildProject(
                      title: 'FAMS Corporate Car Sharing',
                      description:
                          'Developed a private car-sharing app with real-time fleet management, increasing fleet utilization by 50%.',
                      link:
                          'https://apps.apple.com/us/app/fams-corporate-car-sharing/id1524627372',
                    ),
                    Divider(height: 40, thickness: 0.6),
                    _buildSectionTitle('Education'),
                    _buildEducation(
                      'Bachelor of Science in Computer Science',
                      'University of Sargodha, Lahore',
                      '2014 - 2018',
                    ),
                    _buildEducation(
                      'Intermediate in Computer Science',
                      'Pakistan School, Bahrain',
                      '2012 - 2014',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          SizedBox(width: 8),
          isLink
              ? InkWell(
                  onTap: () {
                    // Open link
                    Get.offAllNamed(AppRoutes.portfolio);
                  },
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              : Text(text),
        ],
      ),
    );
  }

  Widget _buildBulletedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Text('• $item')).toList(),
    );
  }

  Widget _buildExperience({
    required String title,
    required String company,
    required String date,
    required List<String> responsibilities,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text('$company | $date'),
          _buildBulletedList(responsibilities),
        ],
      ),
    );
  }

  Widget _buildProject({
    required String title,
    required String description,
    required String link,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(description),
          InkWell(
            onTap: () {
              // Open project link
            },
            child: Text(
              link,
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducation(String degree, String institution, String year) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text('$degree\n$institution | $year'),
    );
  }
}
