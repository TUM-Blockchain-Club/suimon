import './fractal_art.pb.dart' as fractal_art;
import './counter_number.pb.dart' as counter_number;
import './proof_generation.pb.dart' as proof_generation;
import './sample_folder/sample_file.pb.dart' as sample_file;
// ignore_for_file: unused_import

import 'dart:typed_data';
import 'package:rinf/rinf.dart';

final rustSignalHandlers = <int, void Function(Uint8List, Uint8List)>{
2: (Uint8List messageBytes, Uint8List binary) {
  final message = sample_file.SampleOutput.fromBuffer(messageBytes);
  final rustSignal = RustSignal(
    message,
    binary,
  );
  sample_file.sampleOutputController.add(rustSignal);
},
4: (Uint8List messageBytes, Uint8List binary) {
  final message = proof_generation.ProofGenerationOutput.fromBuffer(messageBytes);
  final rustSignal = RustSignal(
    message,
    binary,
  );
  proof_generation.proofGenerationOutputController.add(rustSignal);
},
6: (Uint8List messageBytes, Uint8List binary) {
  final message = counter_number.SampleNumberOutput.fromBuffer(messageBytes);
  final rustSignal = RustSignal(
    message,
    binary,
  );
  counter_number.sampleNumberOutputController.add(rustSignal);
},
8: (Uint8List messageBytes, Uint8List binary) {
  final message = fractal_art.SampleFractal.fromBuffer(messageBytes);
  final rustSignal = RustSignal(
    message,
    binary,
  );
  fractal_art.sampleFractalController.add(rustSignal);
},
};

void assignRustSignal(int messageId, Uint8List messageBytes, Uint8List binary) {
  rustSignalHandlers[messageId]!(messageBytes, binary);
}
