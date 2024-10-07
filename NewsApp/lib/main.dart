import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newsapp_self/core/config/theme/app_theme.dart';
import 'package:newsapp_self/core/constants/routes.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:newsapp_self/firebase_options.dart';
import 'package:newsapp_self/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:newsapp_self/service_locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('SETTINGS');
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    log('Device Height: $deviceHeight and Device Width: $deviceWidth',
        name: 'Dimensions FROM THE MAIN');
    return ScreenUtilInit(
      designSize: Size(deviceWidth, deviceHeight),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThemeCubit(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return MaterialApp.router(
                title: 'News App',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darktTheme,
                themeMode: mode,
                routerConfig: approutes,
              );
            },
          ),
        );
      },
    );
  }
}
