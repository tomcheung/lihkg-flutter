// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appInitializedHash() => r'afb44448a1d47b0261817381449ad63939cb1ff5';

/// See also [appInitialized].
@ProviderFor(appInitialized)
final appInitializedProvider = FutureProvider<bool>.internal(
  appInitialized,
  name: r'appInitializedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appInitializedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppInitializedRef = FutureProviderRef<bool>;
String _$appSystemPropertyHash() => r'7ec15cfd8a6f9abf0d7284ec54a74d2ffe5c2c76';

/// See also [AppSystemProperty].
@ProviderFor(AppSystemProperty)
final appSystemPropertyProvider =
    AsyncNotifierProvider<AppSystemProperty, SystemProperty>.internal(
  AppSystemProperty.new,
  name: r'appSystemPropertyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSystemPropertyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppSystemProperty = AsyncNotifier<SystemProperty>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
