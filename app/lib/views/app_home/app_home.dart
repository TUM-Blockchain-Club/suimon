import 'package:flutter/material.dart' hide BottomNavigationBar, BottomNavigationBarItem;
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

  @override
  void initState() {
    super.initState();
    final walletRepository = context.read<WalletRepository>();
    _suimonRepository = SCSuimonRepository(
      packageId: '',      
      client: walletRepository.client,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SCSuimonRepository>(
          create: (context) => _suimonRepository,
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
    );
  }
}
