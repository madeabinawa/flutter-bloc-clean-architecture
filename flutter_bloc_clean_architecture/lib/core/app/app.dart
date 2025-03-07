import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/app/application/app_bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/routing/router.dart';
import 'package:flutter_bloc_clean_architecture/dependency_container.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppBloc>(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _appRouter = router(context, null);

    return MaterialApp.router(
      routerDelegate: _appRouter.routerDelegate,
      routeInformationParser: _appRouter.routeInformationParser,
    );
  }
}
