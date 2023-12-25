import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma_me/core/manager/auth_cubit/auth_cubit.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/util/api_serves.dart';
import 'package:pharma_me/core/util/app_routes.dart';
import 'package:pharma_me/core/util/cache_serves.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'core/manager/blocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiServes.initial();
  await CacheServes.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>AuthCubit()),
        BlocProvider(create:(context)=>MainCubit()..getWarehouses()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(

            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                )
            ),
            textTheme: GoogleFonts.ubuntuTextTheme(),
            useMaterial3: true
        ),
        title: 'PharmaMe',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.routes,

      ),
    );
  }
}

class PharmaMe extends StatelessWidget {
  const PharmaMe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
