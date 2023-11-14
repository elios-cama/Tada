// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentsRepositoryHash() =>
    r'a584edbac3a47482eea2bf93bad71eda27bd457e';

/// See also [commentsRepository].
@ProviderFor(commentsRepository)
final commentsRepositoryProvider = Provider<CommentsRepository>.internal(
  commentsRepository,
  name: r'commentsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$commentsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CommentsRepositoryRef = ProviderRef<CommentsRepository>;
String _$fetchCommentsHash() => r'3c7933465ec3ac35cd79a3e42b15dc6dc1cf7264';

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

/// See also [fetchComments].
@ProviderFor(fetchComments)
const fetchCommentsProvider = FetchCommentsFamily();

/// See also [fetchComments].
class FetchCommentsFamily extends Family<AsyncValue<List<Comment>>> {
  /// See also [fetchComments].
  const FetchCommentsFamily();

  /// See also [fetchComments].
  FetchCommentsProvider call(
    int postId,
  ) {
    return FetchCommentsProvider(
      postId,
    );
  }

  @override
  FetchCommentsProvider getProviderOverride(
    covariant FetchCommentsProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'fetchCommentsProvider';
}

/// See also [fetchComments].
class FetchCommentsProvider extends AutoDisposeFutureProvider<List<Comment>> {
  /// See also [fetchComments].
  FetchCommentsProvider(
    int postId,
  ) : this._internal(
          (ref) => fetchComments(
            ref as FetchCommentsRef,
            postId,
          ),
          from: fetchCommentsProvider,
          name: r'fetchCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCommentsHash,
          dependencies: FetchCommentsFamily._dependencies,
          allTransitiveDependencies:
              FetchCommentsFamily._allTransitiveDependencies,
          postId: postId,
        );

  FetchCommentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final int postId;

  @override
  Override overrideWith(
    FutureOr<List<Comment>> Function(FetchCommentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCommentsProvider._internal(
        (ref) => create(ref as FetchCommentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Comment>> createElement() {
    return _FetchCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCommentsProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCommentsRef on AutoDisposeFutureProviderRef<List<Comment>> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _FetchCommentsProviderElement
    extends AutoDisposeFutureProviderElement<List<Comment>>
    with FetchCommentsRef {
  _FetchCommentsProviderElement(super.provider);

  @override
  int get postId => (origin as FetchCommentsProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
