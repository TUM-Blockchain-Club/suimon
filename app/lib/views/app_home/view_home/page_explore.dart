import 'package:flutter/material.dart';
import 'package:suimon/blocs/blocs.dart';
import 'package:suimon/repositories/repository_sc_suimon.dart';
import 'package:suimon/widgets/core/core.dart' as core;

class PageExplore extends StatelessWidget {
  const PageExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Text('Map'),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: core.StandardButton(
              label: 'Start Exploring',
              icon: Icons.directions_run_outlined,
              elevation: 24.0,
              onTap: () => context.read<SCSuimonRepository>().mint(),
            ),
          ),
        )
      ],
    );
  }
}
