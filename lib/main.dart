import 'dart:async';

import 'package:flutter/material.dart';
import 'package:who_are_you/application.dart';
import 'package:who_are_you/core/errors/exception_observer.dart';
import 'package:who_are_you/core/infrastructure/infrastructure.dart';
import 'package:who_are_you/core/scopes/app_scopes_builder.dart';

void main() {
  final exceptionObserverService = ExceptionObserver();

  runZonedGuarded(
    () async {
      final infrastructureInterface = InfrastructureInterface.base();

      final appScopesBuilder = AppScopesBuilder.base();

      runApp(
        Application(
          infrastructureInterface: infrastructureInterface,
          appScopesBuilder: appScopesBuilder,
        ),
      );
    },
    exceptionObserverService.onException,
  );
}
