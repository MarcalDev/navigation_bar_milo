library navigation_bar_milo;
import 'package:flutter/material.dart';


class BottomNavigationBarWidget extends StatefulWidget {
  final List<BottomNavigationItem> items;
  final Color? backgroundColor;
  final BorderRadius? backgroundBorderRadius;
  final double? height;
  final Widget child;
  final Widget? floatingActionButton;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? selectedItemFontSize;
  final double? unselectedItemFontSize;
  final FontWeight? unselectedItemFontWeight;
  final FontWeight? selectedItemFontWeight;
  final int selectedItemIndex;
  final void Function(int index)? onTap;
  const BottomNavigationBarWidget({super.key, required this.items, this.backgroundColor, this.backgroundBorderRadius, this.height, required this.child, this.floatingActionButton, this.selectedItemColor, this.unselectedItemColor, this.selectedItemFontSize, this.unselectedItemFontSize, this.unselectedItemFontWeight, this.selectedItemFontWeight, required this.selectedItemIndex, this.onTap});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,     
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          widget.child,
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container( 
                clipBehavior: Clip.hardEdge,
                 decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.grey,
                 borderRadius: widget.backgroundBorderRadius
                ),
                height: widget.height ?? MediaQuery.of(context).size.height / 15,    
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for(var item in widget.items) ...[
                        Expanded(
                          child: GestureDetector(
                            onTap: ()=> widget.onTap!(widget.items.indexOf(item)),
                            child: BottomNavigationItemWidget(
                              icon: widget.items.indexOf(item) == widget.selectedItemIndex ? item.selectedIcon : item.unselectedIcon,
                              title: item.title,
                              titleColor: widget.items.indexOf(item) == widget.selectedItemIndex ? widget.selectedItemColor : widget.unselectedItemColor,
                              titleSize: widget.items.indexOf(item) == widget.selectedItemIndex ? widget.selectedItemFontSize : widget.unselectedItemFontSize,
                              titleWeight: widget.items.indexOf(item) == widget.selectedItemIndex ? widget.selectedItemFontWeight : widget.unselectedItemFontWeight,
                            ),
                          ),
                        ),
                        if(widget.floatingActionButton != null && widget.items.length == 4 && widget.items.indexOf(item) == 1)
                          const SizedBox(width: 65),
                         ],                    
                    ]     
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItemWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final double? titleSize;
  final FontWeight? titleWeight;
  final Color? titleColor;
  final bool showTopSelection;
  const BottomNavigationItemWidget({super.key, required this.icon, required this.title, this.titleSize, this.titleWeight, this.titleColor, this.showTopSelection=false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,  
      crossAxisAlignment: CrossAxisAlignment.center,    
      children: [
        showTopSelection ?
      Container(        
        height: 3,       
        color: titleColor,
      ) : SizedBox(),
      SizedBox(height: 10),
      icon,
      Text(title, 
      style: TextStyle(
        fontSize: titleSize,
        fontWeight: titleWeight,   
        color: titleColor
      ))
    ],);
  }
}

class BottomNavigationItem{
  final Widget selectedIcon;
  final Widget unselectedIcon;
  final String title;

  const BottomNavigationItem({required this.selectedIcon, required this.unselectedIcon, required this.title});
}