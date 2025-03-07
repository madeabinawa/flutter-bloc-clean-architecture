import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/app/application/app_bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/routing/router.dart';
import 'package:flutter_bloc_clean_architecture/dependency_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp({String? initialLocation}) async {
    return pumpWidget(
      BlocProvider(
        create: (_) => AppBloc(
          getIt(),
        ),
        child: Builder(
          builder: (context) {
            final _appRouter = router(context, initialLocation);
            return MaterialApp.router(
              routerDelegate: _appRouter.routerDelegate,
              routeInformationParser: _appRouter.routeInformationParser,
            );
          },
        ),
      ),
    );
  }
}

@isTest
Future<void> testUI({
  String given = '',
  String when = '',
  String then = '',
  required WidgetTesterCallback callback,
}) async {
  return testWidgets(
    '\nGIVEN 👉: $given \n WHEN ⚡️: $when \n THEN 🙌: $then \n',
    callback,
  );
}
