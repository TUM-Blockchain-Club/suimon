import 'package:flutter/material.dart';
import 'package:suimon/blocs/blocs.dart';
import 'package:suimon/repositories/repositories.dart';
import 'package:suimon/views/app_home/view_home/view_home.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  late SCSuimonRepository _suimonRepository;
  late MiningRepository _miningRepository;

  late LocationPermissionBloc _locationPermissionBloc;
  late LocationTrackingBloc _locationTrackingBloc;
  late DiscoverNotificationBloc _discoverNotificationBloc;

  @override
  void initState() {
    super.initState();
    final walletRepository = context.read<WalletRepository>();
    _suimonRepository = SCSuimonRepository(
      packageId: '0xfbd4ce910be7a6a43f98c963947a72f4bdf219bc94968fd5e69a560fc7d4a3da', // ~ contract address
      client: walletRepository.client,
    );
    _miningRepository = MiningRepository();

    _locationPermissionBloc = LocationPermissionBloc(
      miningRepository: _miningRepository,
    );
    _locationTrackingBloc = LocationTrackingBloc(
      miningRepository: _miningRepository,
    );
    _discoverNotificationBloc = DiscoverNotificationBloc(
      scSuimonRepository: _suimonRepository,
      miningRepository: _miningRepository,
    );
  }

  @override
  void dispose() {
    _miningRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SCSuimonRepository>(
          create: (context) => _suimonRepository,
        ),
        RepositoryProvider<MiningRepository>(
          create: (context) => _miningRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LocationPermissionBloc>(
            create: (context) => _locationPermissionBloc..add(RequestLocationPermission()),
          ),
          BlocProvider<LocationTrackingBloc>(
            create: (context) => _locationTrackingBloc..add(StartLocationTracking()),
          ),
          BlocProvider<DiscoverNotificationBloc>(
            create: (context) => _discoverNotificationBloc..add(StartDiscover()),
          ),
        ],
        child: MaterialApp(
          title: 'Suimon',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(settings: const RouteSettings(name: '/'), builder: (context) => const ViewHome());
              default:
                // by default we return the home page
                return MaterialPageRoute(settings: const RouteSettings(name: '/'), builder: (context) => const ViewHome());
            }
          },
        ),
      ),
    );
  }
}
