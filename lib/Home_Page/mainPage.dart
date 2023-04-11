import 'package:flutter/material.dart';
import 'package:untitled/Home_Page/shopping_cart_page.dart';
import 'package:untitled/widgets/extentions.dart';


import '../model/product.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
import '../widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import '../widgets/title_text.dart';
import 'home_page.dart';


class MainPage extends StatefulWidget {
  MainPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;
  Widget _appBar() {
    return Container(
      color: Color.fromARGB(223, 82, 54, 43),
      padding: AppTheme.padding,
      child: Column(
        children: [
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 4,
                child: _icon(Icons.sort, color: Colors.white),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0xfff8f8f8),
                          blurRadius: 10,
                          spreadRadius: 10),
                    ],
                  ),
                  child: Image.asset("assets/user.png"),
                ),
              ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
            ],
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: LightColor.brown.withOpacity(1.0),
          // boxShadow: AppTheme.shadow
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _title() {
    return Container(
        margin: AppTheme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: isHomePageSelected ? 'Our' : 'Shopping',
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
                TitleText(
                  text: isHomePageSelected ? 'Products' : 'Cart',
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            !isHomePageSelected
                ? Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                      Icons.delete_outline,
                      color: LightColor.brown,
                    ),
                ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
                : SizedBox()
          ],
        ));
  }

  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }
  Widget pruductlist(){
    final int itemNo;
    final Product product;
    return Container(
      //width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(

        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x3600000F),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                    child: Text(
                      "kdcdskj",

                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                    child: Text(
                      "kjdkjd"
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    _title(),

                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: isHomePageSelected
                            ? MyHomePage()
                            : Align(
                                alignment: Alignment.topCenter,
                                child: ShoppingCartPage(),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed,
              ),
            )
          ],
        ),
      );
  }
}
