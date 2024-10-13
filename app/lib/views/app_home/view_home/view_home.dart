import 'package:flutter/material.dart' hide BottomNavigationBar, BottomNavigationBarItem;
import 'package:suimon/views/app_home/view_home/page_explore.dart';
import 'package:suimon/views/app_home/view_home/page_inventory.dart';
import 'package:suimon/widgets/core/core.dart' as core;
import 'package:suimon/style/style.dart' as style;

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  int _currentIndex = 0;

  void _onSelect(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildContent() {
    switch (_currentIndex) {
      case 0:
        return const PageExplore(key: ValueKey('explore'));
      case 1:
        return const PageInventory(key: ValueKey('inventory'));
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Material(
      color: style.Colors.background,
      child: Stack(
        children: [
          _buildContent(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.0 + media.padding.bottom),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  core.BottomNavigationBar(
                    items: [
                      core.BottomNavigationBarItem(
                        label: 'Explore',
                        icon: Icons.explore_outlined,
                        activeIcon: Icons.explore,
                        onTap: () {},
                      ),
                      core.BottomNavigationBarItem(
                        label: 'Inventory',
                        icon: Icons.backpack_outlined,
                        activeIcon: Icons.backpack,
                        onTap: () {},
                      ),
                    ],
                    onTap: _onSelect,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
