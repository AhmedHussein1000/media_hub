import 'package:flutter/material.dart';
import 'package:files/presentation/pages/image_page.dart';
import 'package:files/presentation/pages/video_page.dart';
import 'package:files/presentation/pages/audio_page.dart';
import 'package:files/presentation/pages/pdf_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PersistentTabController _controller;
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _pages = const [ImagePage(), VideoPage(), AudioPage(), PdfPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              Colors.red,
              Colors.orangeAccent,
              Colors.yellow,
              Colors.redAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: const Text('Media Hub'),
        ),
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _pages,
        items: _navBarsItems(),
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          colorBehindNavBar: Colors.white,
        ),
        navBarStyle: NavBarStyle.style7,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.image_outlined),
        title: "Images",
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.purpleAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.video_file_outlined),
        title: "Videos",
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.audiotrack_outlined),
        title: "Audios",
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.picture_as_pdf_outlined),
        title: "Pdfs",
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
