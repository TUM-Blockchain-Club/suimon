import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:suimon/models/models.dart' as models;
import 'package:suimon/style/style.dart' as style;

class PageInventory extends StatelessWidget {
  const PageInventory({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaPadding = MediaQuery.of(context).padding;

    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/suimons.json'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // loading animation
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        var data = json.decode(snapshot.data!);
        var suimons = data.map((suimon) => models.Suimon.fromJson(suimon)).toList();

        return ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              style.Colors.background.withOpacity(0.0),
              style.Colors.background,
            ],
            stops: [
              0.0,
              (mediaPadding.top + 24.0) / bounds.height,
            ],
          ).createShader(bounds),
          blendMode: BlendMode.dstIn,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.8,
            ),
            padding: const EdgeInsets.all(16.0) + MediaQuery.of(context).padding,
            itemCount: suimons.length,
            itemBuilder: (context, index) {
              models.Suimon suimon = suimons[index] as models.Suimon;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(suimon.imageUri),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
