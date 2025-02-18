import 'package:who_are_you/core/scopes/bloc_scope.dart';
import 'package:who_are_you/core/scopes/data_source_scope.dart';
import 'package:who_are_you/core/scopes/repositories_scope.dart';

class AppScopes {
  final DataSourcesScope dataSourcesScope;
  final RepositoriesScope repositoriesScope;
  final BlocScope blocScope;

  const AppScopes({
    required this.dataSourcesScope,
    required this.repositoriesScope,
    required this.blocScope,
  });
}
