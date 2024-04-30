import 'package:flutter/material.dart';
import 'package:project/pages/login.page.dart';
import 'package:project/pages/primeiraTela.page.dart';
import 'package:project/pages/register.page.dart';
import 'package:project/pages/segundaTela.page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MainPage(),
      '/segunda_tela': (context) =>
          SegundaTela(ModalRoute.of(context)?.settings.arguments as String),
    },
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 72,
          width: MediaQuery.of(context).size.width,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF00BFA6)),
              label: 'Home',
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Color(0xFF00BFA6)),
              label: 'My Account',
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            HomePage(),
            AboutPage(),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const LoginPage(),
    const RegisterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/purple.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          _pages[_currentIndex],
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('About Page'),
      ),
    );
  }
}
