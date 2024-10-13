import 'package:flutter/material.dart';
import 'package:suimon/blocs/blocs.dart';
import 'package:suimon/widgets/core/core.dart' as core;
import 'package:suimon/style/style.dart' as style;
import 'package:suimon/utils/utils.dart' as utils;
import 'package:suimon/widgets/map.dart';

class PageExplore extends StatelessWidget {
  const PageExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<LocationPermissionBloc, LocationPermissionState>(
          builder: (context, state) {
            return switch (state) {
              LocationPermissionInitial() => const SizedBox(),
              LocationPermissionGranted() => const SuimonMap(),
              LocationPermissionDenied() => Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Location permission denied'),
                      core.StandardButton(
                        label: 'Request permission',
                        icon: Icons.location_on_outlined,
                        onTap: () => context.read<LocationPermissionBloc>().add(RequestLocationPermission()),
                      ),
                    ],
                  ),
                ),
              ),
              LocationPermissionUndecided() => const SizedBox(),
            };
          },
        ),
        BlocBuilder<DiscoverNotificationBloc, DiscoverNotificationState>(
          builder: (context, state) {
            return switch (state) {
              DiscoverInitial() => const SizedBox(),
              DiscoverRunning() => const SizedBox(),
              DiscoveredSuimon(suimonId: var suimonId)
                || CatchingSuimon(suimonId: var suimonId)
                || CaughtSuimon(suimonId: var suimonId) => Positioned.fill(
                child: Stack(
                  children: [
                    ModalBarrier(
                      color: Colors.black.withOpacity(0.5),
                      dismissible: false,
                    ),
                    const Positioned.fill(
                      child: Center(
                        child: Text('Found a Suimon!'),
                      ),
                    ),
                    Positioned(
                      bottom: 24.0,
                      left: 0.0,
                      right: 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: utils.space(12.0, [
                          core.StandardButton(
                            label: 'Discard',
                            icon: Icons.delete_outline,
                            foreground: style.Colors.onNegative,
                            background: style.Colors.negative,
                            elevation: 24.0,
                            onTap: () => context.read<DiscoverNotificationBloc>().add(DiscardDiscoveredSuimon()),
                          ),
                          core.StandardButton(
                            label: 'Catch',
                            icon: Icons.catching_pokemon_outlined,
                            foreground: style.Colors.onPositive,
                            background: style.Colors.positive,
                            elevation: 24.0,
                            onTap: () => context.read<DiscoverNotificationBloc>().add(CatchDiscoveredSuimon()),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              DiscoverError(message: var message) => Positioned.fill(
                child: Center(
                  child: Text('Error: $message'),
                ),
              ),
            };
          },
        ),
      ],
    );
  }
}
