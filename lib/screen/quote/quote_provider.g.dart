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

typedef QuoteRef = AutoDisposeFutureProviderRef<List<Quote>>;

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
    required this.threadId,
    required this.postId,
  }) : super.internal(
          (ref) => quote(
            ref,
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
        );

  final String threadId;
  final String postId;

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
