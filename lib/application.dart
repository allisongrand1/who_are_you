import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:who_are_you/config/navigation/app_router.dart';
import 'package:who_are_you/config/themes/theme_factory.dart';
import 'package:who_are_you/core/infrastructure/infrastructure.dart';
import 'package:who_are_you/core/scopes/app_scopes_builder.dart';
import 'package:who_are_you/core/scopes/bloc_scope.dart';
import 'package:who_are_you/core/scopes/data_source_scope.dart';
import 'package:who_are_you/core/scopes/repositories_scope.dart';
import 'package:who_are_you/data/storage/storage.dart';

class Application extends StatefulWidget {
  final InfrastructureInterface infrastructureInterface;
  final AppScopesBuilder appScopesBuilder;

  const Application({
    required this.infrastructureInterface,
    required this.appScopesBuilder,
    super.key,
  });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final GoRouter router;
  late final ThemeData theme;
  late final RepositoriesScope _repositoriesScope;
  late final DataSourcesScope _dataSourcesScope;
  late final BlocScope _blocScope;
  late final Storage _storage;

  @override
  void initState() {
    super.initState();

    _initScopes();

    router = AppRouter.routerConfig();
    theme = ThemeFactory.createTheme(Theme.light);
  }

  @override
  void dispose() {
    super.dispose();

    _storage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _repositoriesScope),
        Provider.value(value: _dataSourcesScope),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => _blocScope.faceDetectionBloc),
          BlocProvider(create: (_) => _blocScope.faceCompareBloc),
        ],
        child: MaterialApp.router(
          title: 'Who are you',
          debugShowCheckedModeBanner: false,
          theme: theme,
          routerConfig: router,
        ),
      ),
    );
  }

  void _initScopes() {
    final scopes = widget.appScopesBuilder.buildScopes(widget.infrastructureInterface);

    _repositoriesScope = scopes.repositoriesScope;
    _dataSourcesScope = scopes.dataSourcesScope;
    _blocScope = scopes.blocScope;
    _storage = scopes.storage;
  }
}
