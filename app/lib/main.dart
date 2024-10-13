import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suimon/repositories/repositories.dart';
import 'package:suimon/blocs/blocs.dart';
import 'package:suimon/views/app_home/app_home.dart';
import 'package:suimon/views/app_login/app_login.dart';
import 'package:rinf/rinf.dart';
import './messages/all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeRust(assignRustSignal);
  // Log bloc events
  Bloc.observer = DefaultBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late WalletRepository _walletRepository;

  late WalletBloc _walletBloc;

  @override
  void initState() {
    super.initState();
    _walletRepository = WalletRepository();

    _walletBloc = WalletBloc(walletRepository: _walletRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WalletRepository>(
          create: (context) => _walletRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WalletBloc>(
            create: (context) => _walletBloc..add(WalletConnect()),
          ),
        ],
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            if (state is WalletConnected) {
              return const AppHome();
            } else if (state is WalletInitial) {
              return const AppLogin();
            } else {
              return const AppLogin();
            }
          },
        ),
      ),
    );
  }
}
