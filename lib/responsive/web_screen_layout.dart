import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title:
              SvgPicture.asset('assets/ic_instagram.svg', color: primaryColor),
          actions: [
            IconButton(
              onPressed: () => navigationTapped(0),
              color: _page == 0 ? primaryColor : secondaryColor,
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () => navigationTapped(1),
              color: _page == 1 ? primaryColor : secondaryColor,
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => navigationTapped(2),
              color: _page == 2 ? primaryColor : secondaryColor,
              icon: const Icon(Icons.add_a_photo),
            ),
            IconButton(
              onPressed: () => navigationTapped(3),
              color: _page == 3 ? primaryColor : secondaryColor,
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
                onPressed: () => navigationTapped(4),
                color: _page == 4 ? primaryColor : secondaryColor,
                icon: const Icon(Icons.person))
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: homeScreenItems,
          controller: pageController,
          onPageChanged: onPageChanged,
        ));
  }
}
