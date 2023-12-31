// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsRepositoryHash() => r'093d4416ecc27591c9ecf0829dc5699a2c892db5';

/// See also [postsRepository].
@ProviderFor(postsRepository)
final postsRepositoryProvider = Provider<PostsRepository>.internal(
  postsRepository,
  name: r'postsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostsRepositoryRef = ProviderRef<PostsRepository>;
String _$createPostHash() => r'c317ad3e333f5a50075f4c329c28b59c8e9206ef';

/// See also [createPost].
@ProviderFor(createPost)
final createPostProvider = AutoDisposeFutureProvider<Post>.internal(
  createPost,
  name: r'createPostProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$createPostHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreatePostRef = AutoDisposeFutureProviderRef<Post>;
String _$fetchPostsHash() => r'bfe30dcd7479103806c24579830e254d5975fa75';

/// See also [fetchPosts].
@ProviderFor(fetchPosts)
final fetchPostsProvider = AutoDisposeFutureProvider<List<Post>>.internal(
  fetchPosts,
  name: r'fetchPostsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchPostsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPostsRef = AutoDisposeFutureProviderRef<List<Post>>;
String _$fetchPostHash() => r'c06ffce18752bb102eee293a1afbe3b6410d675e';

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

/// See also [fetchPost].
@ProviderFor(fetchPost)
const fetchPostProvider = FetchPostFamily();

/// See also [fetchPost].
class FetchPostFamily extends Family<AsyncValue<Post>> {
  /// See also [fetchPost].
  const FetchPostFamily();

  /// See also [fetchPost].
  FetchPostProvider call(
    int postId,
  ) {
    return FetchPostProvider(
      postId,
    );
  }

  @override
  FetchPostProvider getProviderOverride(
    covariant FetchPostProvider provider,
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
  String? get name => r'fetchPostProvider';
}

/// See also [fetchPost].
class FetchPostProvider extends AutoDisposeFutureProvider<Post> {
  /// See also [fetchPost].
  FetchPostProvider(
    int postId,
  ) : this._internal(
          (ref) => fetchPost(
            ref as FetchPostRef,
            postId,
          ),
          from: fetchPostProvider,
          name: r'fetchPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPostHash,
          dependencies: FetchPostFamily._dependencies,
          allTransitiveDependencies: FetchPostFamily._allTransitiveDependencies,
          postId: postId,
        );

  FetchPostProvider._internal(
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
    FutureOr<Post> Function(FetchPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPostProvider._internal(
        (ref) => create(ref as FetchPostRef),
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
  AutoDisposeFutureProviderElement<Post> createElement() {
    return _FetchPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPostProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPostRef on AutoDisposeFutureProviderRef<Post> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _FetchPostProviderElement extends AutoDisposeFutureProviderElement<Post>
    with FetchPostRef {
  _FetchPostProviderElement(super.provider);

  @override
  int get postId => (origin as FetchPostProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
