// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appInitializedHash() => r'edacffc282f8212b8542eec9f301e3c76fcaeb6a';

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
String _$appSystemPropertyHash() => r'16661eb9c5c4543d9497ae5304f55bbc0e40a686';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
