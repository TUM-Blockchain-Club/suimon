import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suimon/repositories/repositories.dart';

part 'discover_notification_event.dart';
part 'discover_notification_state.dart';

class DiscoverNotificationBloc extends Bloc<DiscoverNotificationEvent, DiscoverNotificationState> {
  final SCSuimonRepository scSuimonRepository;
  final MiningRepository miningRepository;

  DiscoverNotificationBloc({
    required this.scSuimonRepository,
    required this.miningRepository,
  }) : super(DiscoverInitial()) {

    on<StartDiscover>((event, emit) async {
      emit(DiscoverRunning());
      try {
        miningRepository.startMining();
        emit(DiscoverRunning());
        emit(DiscoveredSuimon(suimonId: 1));
      } catch (e) {
        emit(DiscoverError(message: e.toString()));
      }
    });

    on<CatchDiscoveredSuimon>((event, emit) async {
      var state = this.state;
      if (state is DiscoveredSuimon) {
        emit(CatchingSuimon(suimonId: state.suimonId));
        var res = await scSuimonRepository.mint(/** add args */);
        if (res) {
          emit(CaughtSuimon(suimonId: state.suimonId));
          await Future.delayed(const Duration(seconds: 3));
          emit(DiscoverRunning());
        } else {
          emit(DiscoveredSuimon(suimonId: state.suimonId));
        }
      }
    });

    on<DiscardDiscoveredSuimon>((event, emit) {
      emit(DiscoverRunning());
    });
  }
}
