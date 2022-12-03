import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/pages/home_page.dart';
import 'package:menuapp/ui/pages/order_page.dart';
import 'package:menuapp/utils/assets_data.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {

  int indexPage = 0;

  late final PageController _pageController;

  List<Widget> _pages = [
    HomePage(),
    OrderPage(),
    Center(child: Text("Favoritos",),),
    Center(child: Text("Mi Perfil",),),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =  PageController(initialPage: indexPage );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: kBrandSecondaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28.0),
            topRight: Radius.circular(28.0),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(
            color: Colors.white70,
              fontSize: 13.0
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 13.0,
            color: kBrandPrimaryColor,
          ),
          selectedItemColor: kBrandPrimaryColor,
          unselectedItemColor: Colors.white70,
          onTap: (int value){
            indexPage = value;
            _pageController.jumpToPage(indexPage);
            setState(() {

            });
          },
          currentIndex: indexPage,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetData.iconHome,
                color: indexPage == 0 ? kBrandPrimaryColor : Colors.white,
              ),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetData.iconCart,
                color: indexPage == 1 ? kBrandPrimaryColor : Colors.white,
              ),
              label: "Ordenes",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetData.iconFavorite,
                color: indexPage == 2 ? kBrandPrimaryColor : Colors.white,
              ),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetData.iconProfile,
                color: indexPage == 3 ? kBrandPrimaryColor : Colors.white,
              ),
              label: "Mi perfil",
            ),
          ],
        ),
      ),
    );
  }
}