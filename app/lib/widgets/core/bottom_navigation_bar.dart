import 'package:flutter/material.dart';
import 'package:suimon/style/style.dart' as style;
import 'package:suimon/utils/utils.dart' as utils;
import 'package:suimon/widgets/core/button.dart' as core;

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({
    super.key,
    this.initialIndex = 0,
    required this.items,
    required this.onTap,
  });

  final int initialIndex;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(index);
    widget.items[index].onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: utils.separate(
              Container(
                width: 4.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      style.Colors.grayDark,
                      style.Colors.black,
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
              widget.items.map((item) {
                bool isSelected = widget.items.indexOf(item) == _selectedIndex;
                return Expanded(
                  flex: 1,
                  child: core.Button(
                    content: Center(
                      child: Icon(isSelected ? item.activeIcon : item.icon, size: 38.0),
                    ),
                    onTap: () => _onTap(widget.items.indexOf(item)),
                  ),
                );
              },
            ).toList()),
          ),
        ),
      ),
    );
  }
}

class BottomNavigationBarItem {
  const BottomNavigationBarItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final VoidCallback onTap;
}
