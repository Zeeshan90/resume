import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:resume/portfolio.dart';
import 'package:resume/resume/resume.dart';

class AppRoutes {
  static const String resume = '/resume';
  static const String portfolio = '/portfolio';

  static final List<GetPage> pages = [
    GetPage(name: resume, page: () => ResumePage()),
    GetPage(name: portfolio, page: () => PortfolioPage()),
  ];
}
