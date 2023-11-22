// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_content_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$threadContentSizeHash() => r'6203d7d464fe13aa69d4c5a0ba70192bee582fe0';

/// See also [threadContentSize].
@ProviderFor(threadContentSize)
final threadContentSizeProvider = AutoDisposeProvider<int>.internal(
  threadContentSize,
  name: r'threadContentSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$threadContentSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ThreadContentSizeRef = AutoDisposeProviderRef<int>;
String _$threadContentHash() => r'2202f1b2f28d443b1a5ec837b0152fb0ed093f91';

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

  FutureOr<ThreadContentState> build(
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
    ThreadCategoryItem categoryItem,
  ) : this._internal(
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
          categoryItem: categoryItem,
        );

  ThreadContentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryItem,
  }) : super.internal();

  final ThreadCategoryItem categoryItem;

  @override
  FutureOr<ThreadContentState> runNotifierBuild(
    covariant ThreadContent notifier,
  ) {
    return notifier.build(
      categoryItem,
    );
  }

  @override
  Override overrideWith(ThreadContent Function() create) {
    return ProviderOverride(
      origin: this,
      override: ThreadContentProvider._internal(
        () => create()..categoryItem = categoryItem,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryItem: categoryItem,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ThreadContent, ThreadContentState>
      createElement() {
    return _ThreadContentProviderElement(this);
  }

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
}

mixin ThreadContentRef
    on AutoDisposeAsyncNotifierProviderRef<ThreadContentState> {
  /// The parameter `categoryItem` of this provider.
  ThreadCategoryItem get categoryItem;
}

class _ThreadContentProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ThreadContent,
        ThreadContentState> with ThreadContentRef {
  _ThreadContentProviderElement(super.provider);

  @override
  ThreadCategoryItem get categoryItem =>
      (origin as ThreadContentProvider).categoryItem;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
