import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_bloc_temp/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_mvvm_bloc_temp/presentation/blocs/theme/theme_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/l10n.dart';
import 'presentation/blocs/home/home_cubit.dart';
import 'presentation/views/views.dart';
import 'data/repositories/repositories.dart';
import 'di/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
                memoRepository: locator<MemoRepository>(),
                binanceRepository: locator<BinanceRepository>()
            ),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(prefs: locator<SharedPreferences>()),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            ThemeData themeData = ThemeData.light();
            if (state is ThemeLoaded) {
              themeData = state.attrs.colors;
            }

            return MaterialApp(
              title: 'Flutter MVVM Bloc Template',
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: themeData,
              home: const MyHomePage(),
            );
          },
        )
    );
  }
}

