// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_content_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$threadContentHash() => r'705a31c2a39080885295f33c98691d1f103e9264';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ThreadContent
    extends BuildlessAutoDisposeAsyncNotifier<ThreadContentState> {
  late final ThreadCategoryItem categoryItem;

  Future<ThreadContentState> build(
    ThreadCategoryItem categoryItem,
  );
}

/// See also [ThreadContent].
@ProviderFor(ThreadContent)
const threadContentProvider = ThreadContentFamily();

/// See also [ThreadContent].
class ThreadContentFamily extends Family<AsyncValue<ThreadContentState>> {
  /// See also [ThreadContent].
  const ThreadContentFamily();

  /// See also [ThreadContent].
  ThreadContentProvider call(
    ThreadCategoryItem categoryItem,
  ) {
    return ThreadContentProvider(
      categoryItem,
    );
  }

  @override
  ThreadContentProvider getProviderOverride(
    covariant ThreadContentProvider provider,
  ) {
    return call(
      provider.categoryItem,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'threadContentProvider';
}

/// See also [ThreadContent].
class ThreadContentProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ThreadContent, ThreadContentState> {
  /// See also [ThreadContent].
  ThreadContentProvider(
    this.categoryItem,
  ) : super.internal(
          () => ThreadContent()..categoryItem = categoryItem,
          from: threadContentProvider,
          name: r'threadContentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$threadContentHash,
          dependencies: ThreadContentFamily._dependencies,
          allTransitiveDependencies:
              ThreadContentFamily._allTransitiveDependencies,
        );

  final ThreadCategoryItem categoryItem;

  @override
  bool operator ==(Object other) {
    return other is ThreadContentProvider && other.categoryItem == categoryItem;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryItem.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<ThreadContentState> runNotifierBuild(
    covariant ThreadContent notifier,
  ) {
    return notifier.build(
      categoryItem,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
