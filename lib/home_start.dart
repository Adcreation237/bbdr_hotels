import 'package:bbdr_hotel/home/home_page.dart';
import 'package:flutter/material.dart';

class HomeStart extends StatefulWidget {
  final int pages;
  const HomeStart({Key? key, required this.pages}) : super(key: key);

  @override
  _HomeStartState createState() => _HomeStartState();
}

class _HomeStartState extends State<HomeStart> {
  bool noti = false;

  int? selectIndex;

  List<Widget> optionPage = <Widget>[
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  void onItemTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.pages == null) {
      selectIndex = 0;
    } else {
      selectIndex = widget.pages;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: optionPage.elementAt(selectIndex!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: noti == true
                ? Stack(
                    children: [
                      Icon(
                        Icons.content_paste_outlined,
                      ),
                      Positioned(
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ],
                  )
                : Icon(
                    Icons.content_paste_outlined,
                  ),
            label: "Reservations",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Compte",
          ),
        ],
        currentIndex: selectIndex!,
        onTap: onItemTap,
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.black, opacity: 2),
        showUnselectedLabels: true,
        unselectedIconTheme: IconThemeData(color: Colors.grey, opacity: 2),
        enableFeedback: true,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedLabelStyle: TextStyle(fontSize: 8),
        selectedLabelStyle: TextStyle(fontSize: 8),
      ),
    );
  }
}
