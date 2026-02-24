import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFFFFD700), // Gold Color
      ),
    ));

// ---------------------------------------------------------
// ၁။ SPLASH SCREEN (အဖွင့်မျက်နှာပြင်)
// ---------------------------------------------------------
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.all_inclusive, color: Color(0xFFFFD700), size: 100),
            SizedBox(height: 20),
            Text('Connect', style: TextStyle(color: Color(0xFFFFD700), fontSize: 35, fontWeight: FontWeight.bold)),
            Text('ကမ္ဘာကြီးနဲ့ ချိတ်ဆက်လိုက်ပါ', style: TextStyle(color: Colors.white70, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// ၂။ LOGIN SCREEN (အကောင့်ဝင်ရန်)
// ---------------------------------------------------------
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ကြိုဆိုပါတယ်', style: TextStyle(color: Color(0xFFFFD700), fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 50),
            _loginButton(context, 'Google ဖြင့်ဝင်မည်', Colors.white, Colors.black),
            SizedBox(height: 20),
            _loginButton(context, 'ဖုန်းနံပါတ်ဖြင့်ဝင်မည်', Colors.transparent, Color(0xFFFFD700), isBorder: true),
          ],
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context, String text, Color bg, Color txt, {bool isBorder = false}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: bg,
          side: isBorder ? BorderSide(color: Color(0xFFFFD700)) : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainNavigation())),
        child: Text(text, style: TextStyle(color: txt, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// ---------------------------------------------------------
// ၃။ MAIN NAVIGATION (ပင်မလမ်းညွှန်စနစ်)
// ---------------------------------------------------------
class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [FeedScreen(), ChatListScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xFFFFD700),
        unselectedItemColor: Colors.white54,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ပင်မ'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'မက်ဆေ့ချ်'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ကျွန်ုပ်'),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// ၄။ FEED SCREEN (ပို့စ်များကြည့်ရန်)
// ---------------------------------------------------------
class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Stack(
          children: [
            Container(color: Colors.grey[900], child: Center(child: Icon(Icons.play_arrow, size: 80, color: Colors.white24))),
            Positioned(bottom: 30, left: 20, child: Text('@user_$index\nBeautiful moment...', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// ၅။ CHAT & PROFILE (အကျဉ်းချုပ်)
// ---------------------------------------------------------
class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('မက်ဆေ့ချ်များ', style: TextStyle(color: Color(0xFFFFD700)))), body: Center(child: Text('စာရင်းများမရှိသေးပါ')));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundColor: Color(0xFFFFD700), child: Icon(Icons.person, size: 50, color: Colors.black)),
            SizedBox(height: 20),
            Text('ကိုကို', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('ကျွန်ုပ်၏ ပရိုဖိုင်', style: TextStyle(color: Colors.white54)),
          ],
        ),
      ),
    );
  }
}
