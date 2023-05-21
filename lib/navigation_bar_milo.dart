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
  final EdgeInsetsGeometry? outsidePadding;
  final Color? floatingButtonBorderColor;
  final EdgeInsetsGeometry? insidePadding;
  const BottomNavigationBarWidget({super.key, required this.items, this.backgroundColor, this.backgroundBorderRadius, this.height, required this.child, this.floatingActionButton, this.selectedItemColor, this.unselectedItemColor, this.selectedItemFontSize, this.unselectedItemFontSize, this.unselectedItemFontWeight, this.selectedItemFontWeight, required this.selectedItemIndex, this.onTap, this.outsidePadding, this.floatingButtonBorderColor, this.insidePadding});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.floatingButtonBorderColor
        ),
        padding: widget.floatingButtonBorderColor != null ? const EdgeInsets.all(5) : EdgeInsets.zero,
        child: widget.floatingActionButton,
      ),      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: widget.outsidePadding?? EdgeInsets.zero,
        child: Column(
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
                  child: Padding(
                    padding: widget.insidePadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      ),
    );
  }
}

class BottomNavigationItemWidget extends StatelessWidget {
  final Widget icon;
  final String? title;
  final double? titleSize;
  final FontWeight? titleWeight;
  final Color? titleColor;
  final bool showTopSelection;
  const BottomNavigationItemWidget({super.key, required this.icon, this.title, this.titleSize, this.titleWeight, this.titleColor, this.showTopSelection=false});

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
      ) : const SizedBox(),
      const SizedBox(height: 10),
      icon,
      title != null ?
        Text(title!, 
        style: TextStyle(
          fontSize: titleSize,
          fontWeight: titleWeight,   
          color: titleColor
        )) : const SizedBox()
    ],);
  }
}

class BottomNavigationItem{
  final Widget selectedIcon;
  final Widget unselectedIcon;
  final String? title;

  const BottomNavigationItem({required this.selectedIcon, required this.unselectedIcon, this.title});
}