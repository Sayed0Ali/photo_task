import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_photo/config/cubit/theme_data_cubit.dart';
import 'package:task_photo/simple_bloc_observer.dart';
import 'package:task_photo/ui/home/home_screen.dart';
import 'api/model/response/photo_response.dart';
import 'config/app_theme.dart';
import 'core/di/di.dart';
import 'domain/model/photo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(PhotoAdapter());
  Hive.registerAdapter(SrcAdapter());
  Hive.registerAdapter(PhotoResponseAdapter());
  configureDependencies();
  runApp(BlocProvider(create: (_) => ThemeDataCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeDataCubit, ThemeDataState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              (state is ThemeChangeLight) ? ThemeMode.light : ThemeMode.dark,
          initialRoute: HomeScreen.routeName,
          routes: {HomeScreen.routeName: (context) => HomeScreen()},
        );
      },
    );
  }
}
