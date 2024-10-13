import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rinf/rinf.dart';
import '../../../messages/counter_number.pb.dart';
import '../../../messages/fractal_art.pb.dart';

class PageInventory extends StatefulWidget {
  const PageInventory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PageInventoryState createState() => _PageInventoryState();
}

class _PageInventoryState extends State<PageInventory> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    // Initialize Rust lifecycle listener
    _listener = AppLifecycleListener(
      onExitRequested: () async {
        finalizeRust(); // Shuts down the async Rust runtime
        return AppExitResponse.exit;
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: const Center(
        child: MyColumn(), // Use the custom Rust-integrated widget
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Send a signal to Rust when the button is pressed
          SampleNumberInput(
            letter: 'HELLO FROM DART!',
            dummyOne: 25,
            dummyTwo: SampleSchema(
              sampleFieldOne: true,
              sampleFieldTwo: false,
            ),
            dummyThree: [4, 5, 6],
          ).sendSignalToRust();
        },
        tooltip: 'Send to Rust',
        child: const Icon(Icons.send),
      ),
    );
  }
}

class MyColumn extends StatelessWidget {
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final children = [
      // StreamBuilder listens to Rust signals and updates the UI
      StreamBuilder(
        stream: SampleFractal.rustSignalStream,
        builder: (context, snapshot) {
          final rustSignal = snapshot.data;
          if (rustSignal == null) {
            return Container(
              margin: const EdgeInsets.all(20),
              width: 256,
              height: 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: Colors.black,
              ),
            );
          }
          final imageData = rustSignal.binary;
          return Container(
            margin: const EdgeInsets.all(20),
            width: 256,
            height: 256,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.memory(
                  imageData,
                  width: 256,
                  height: 256,
                  gaplessPlayback: true,
                ),
              ),
            ),
          );
        },
      ),
      StreamBuilder(
        // Listen to number updates from Rust
        stream: SampleNumberOutput.rustSignalStream,
        builder: (context, snapshot) {
          final rustSignal = snapshot.data;
          if (rustSignal == null) {
            return const Text('Initial value: 0');
          }
          final sampleNumberOutput = rustSignal.message;
          final currentNumber = sampleNumberOutput.currentNumber;
          return Text('Current value: $currentNumber');
        },
      ),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
