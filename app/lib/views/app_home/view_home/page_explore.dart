import 'package:flutter/material.dart';
import 'package:suimon/blocs/blocs.dart';
import 'package:suimon/repositories/repository_sc_suimon.dart';
import 'package:suimon/widgets/core/core.dart' as core;

class PageExplore extends StatelessWidget {
  const PageExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: core.StandardButton(
        label: 'Mint',
        icon: Icons.egg_outlined,
        onTap: () => context.read<SCSuimonRepository>().mint(),
      ),
    );
  }
}
