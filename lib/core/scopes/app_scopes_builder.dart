import 'package:who_are_you/core/infrastructure/infrastructure.dart';
import 'package:who_are_you/core/scopes/app_scopes.dart';
import 'package:who_are_you/core/scopes/bloc_scope.dart';
import 'package:who_are_you/core/scopes/data_source_scope.dart';
import 'package:who_are_you/core/scopes/repositories_scope.dart';
import 'package:who_are_you/data/storage/shared_pref_storage.dart';

abstract class AppScopesBuilder {
  static AppScopesBuilder base() => _BaseAppScopesBuilder();

  AppScopes buildScopes(InfrastructureInterface infrastructureScope);
}

class _BaseAppScopesBuilder implements AppScopesBuilder {
  @override
  AppScopes buildScopes(InfrastructureInterface infrastructureScope) {
    final storage = SharedPrefStorage()..init();

    final dataSourcesScope = DataSourcesScope.create(infrastructureScope: infrastructureScope);

    final repositoriesScope = RepositoriesScope.create(dataSourcesScope: dataSourcesScope);

    final blocScope =
        BlocScope.create(dataSourcesScope: dataSourcesScope, repositoriesScope: repositoriesScope, storage: storage);

    return AppScopes(
      dataSourcesScope: dataSourcesScope,
      repositoriesScope: repositoriesScope,
      blocScope: blocScope,
    );
  }
}
