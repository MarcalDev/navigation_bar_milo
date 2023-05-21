import 'package:flutter/material.dart';
import 'package:navigation_bar_milo/navigation_bar_milo.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int tabIndex = 0;

  void updateIndex(int index){
    setState((){
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBarWidget(
      onTap: (index)=> updateIndex(index),      
      selectedItemColor: Colors.amber,
      selectedItemIndex: tabIndex,
      selectedItemFontSize: 12,
      unselectedItemFontSize: 12,      
      floatingActionButton: SizedBox(
           height: 55,
           width: 55,
           child: FittedBox(
             child: FloatingActionButton(
               backgroundColor: Colors.black,
               child: const Icon(Icons.add_rounded, size: 40),
               onPressed: () {},
             ),
           ),
         ),
      items: const[
        BottomNavigationItem(
          selectedIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.home),
          ),
          unselectedIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.home, color: Colors.white,),
          ),
        title: 'Hoje',
        ),
       BottomNavigationItem(
          selectedIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.home),
          ),
          unselectedIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.home, color: Colors.white,),
          ),
        title: 'Solicitações',
        ),
        BottomNavigationItem(
          selectedIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.home),
          ),
          unselectedIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.home, color: Colors.white,),
          ),
        title: 'Relatórios',
        ),
        BottomNavigationItem(
          selectedIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.home),
          ),
          unselectedIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.home, color: Colors.white,),
          ),
        title: 'Mais',
        ),    
    ], child: Column());
  }
}