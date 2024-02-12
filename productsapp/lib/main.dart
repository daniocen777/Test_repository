import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routers/app_router.dart';
import 'core/services/injection_container.dart';
import 'core/themes/app_theme.dart';
import 'src/products/presentation/bloc/product_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Products App',
        theme: AppTheme().getTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
