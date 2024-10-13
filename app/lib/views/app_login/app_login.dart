import 'package:flutter/material.dart';
import 'package:suimon/blocs/blocs.dart';

import 'package:suimon/style/style.dart' as style;
import 'package:suimon/widgets/core/core.dart' as core;

class AppLogin extends StatelessWidget {
  const AppLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suimon',
      debugShowCheckedModeBanner: false,
      home: Material(
        color: style.Colors.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        color: style.Colors.gray,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: core.StandardButton(
                        label: 'Connect Wallet',
                        icon: Icons.wallet,
                        onTap: () => context.read<WalletBloc>().add(WalletConnect()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
