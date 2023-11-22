// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quoteHash() => r'3d064093121346ebf3cb1123cb84dfde61a621f3';

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

/// See also [quote].
@ProviderFor(quote)
const quoteProvider = QuoteFamily();

/// See also [quote].
class QuoteFamily extends Family<AsyncValue<List<Quote>>> {
  /// See also [quote].
  const QuoteFamily();

  /// See also [quote].
  QuoteProvider call({
    required String threadId,
    required String postId,
  }) {
    return QuoteProvider(
      threadId: threadId,
      postId: postId,
    );
  }

  @override
  QuoteProvider getProviderOverride(
    covariant QuoteProvider provider,
  ) {
    return call(
      threadId: provider.threadId,
      postId: provider.postId,
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
  String? get name => r'quoteProvider';
}

/// See also [quote].
class QuoteProvider extends AutoDisposeFutureProvider<List<Quote>> {
  /// See also [quote].
  QuoteProvider({
    required String threadId,
    required String postId,
  }) : this._internal(
          (ref) => quote(
            ref as QuoteRef,
            threadId: threadId,
            postId: postId,
          ),
          from: quoteProvider,
          name: r'quoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quoteHash,
          dependencies: QuoteFamily._dependencies,
          allTransitiveDependencies: QuoteFamily._allTransitiveDependencies,
          threadId: threadId,
          postId: postId,
        );

  QuoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.threadId,
    required this.postId,
  }) : super.internal();

  final String threadId;
  final String postId;

  @override
  Override overrideWith(
    FutureOr<List<Quote>> Function(QuoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuoteProvider._internal(
        (ref) => create(ref as QuoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        threadId: threadId,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Quote>> createElement() {
    return _QuoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuoteProvider &&
        other.threadId == threadId &&
        other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, threadId.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuoteRef on AutoDisposeFutureProviderRef<List<Quote>> {
  /// The parameter `threadId` of this provider.
  String get threadId;

  /// The parameter `postId` of this provider.
  String get postId;
}

class _QuoteProviderElement
    extends AutoDisposeFutureProviderElement<List<Quote>> with QuoteRef {
  _QuoteProviderElement(super.provider);

  @override
  String get threadId => (origin as QuoteProvider).threadId;
  @override
  String get postId => (origin as QuoteProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
