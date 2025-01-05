import 'package:app/pages/courses/course_detail_page.dart';
import 'package:app/pages/auth/login_page.dart';
import 'package:app/pages/auth/register_page.dart';
import 'package:app/pages/help_support/help_support_widget.dart';
import 'package:app/pages/lesson/lesson_page.dart';
import 'package:app/pages/my_courses/my_courses.dart';
import 'package:app/pages/play/play.dart';
import 'package:app/pages/question/bloc/question_bloc.dart';
import 'package:app/pages/question/question_page.dart';
import 'package:app/pages/search/search_page.dart';
import 'package:app/pages/user/user_page.dart';
import 'package:app/utls/use_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import 'pages/home/home_page.dart';
import 'pages/lesson/bloc/lesson_detail_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Kiểm tra trạng thái đăng nhập
  final token = await getToken();
  final isLoggedIn = (token.toString().length > 1) ? true : false;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => LessonDetailBloc()),
      BlocProvider(create: (_) => QuestionBloc())
    ],
    child: MyApp(
      isLoggedIn: isLoggedIn,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const MainTabBarPage() : const LoginPage(),
      routes: {
        CourseDetailPage.routeName: (context) => const CourseDetailPage(),
        HomePage.routeName: (context) => const MainTabBarPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        LessonPage.routeName: (context) => const LessonPage(),
        QuestionPage.routeName: (context) => const QuestionPage(),
        UserPage.routeName: (context) => const UserPage(),
        MyCourses.routeName: (context) => const MyCourses(),
        PlayPage.routeName: (context) => const PlayPage(),
        HelpSupportPage.routeName: (context) => const HelpSupportPage(),
        //SearchPage.routeName: (context) => const SearchPage(),
      },
    );
  }
}

class MainTabBarPage extends StatefulWidget {
  const MainTabBarPage({super.key});

  @override
  State<MainTabBarPage> createState() => _MainTabBarPageState();
}

class _MainTabBarPageState extends State<MainTabBarPage> {
  int selectedIndex = 0;

  static List<Widget> tabBarPages = [
    const HomePage(),
    const PlayPage(),
    const MyCourses(),
    const UserPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      _checkLoginStatus();
    });
  }

  Future<void> _checkLoginStatus() async {
    final token = getToken();
    final isLoggedIn = (token.toString().length > 1) ? true : false;
    if (!isLoggedIn) {
      // Điều hướng đến trang đăng nhập nếu chưa đăng nhập
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBarPages[selectedIndex],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  BottomNavigationBar bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.play,
              ),
              label: "Play"),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.video,
              ),
              label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.user_2,
              ),
              label: "User"),
        ]);
  }
}
