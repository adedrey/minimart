// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$toastHash() => r'91cd13d789a45aae3b11f22c1bfe8d78e98fbfff';

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

/// See also [toast].
@ProviderFor(toast)
const toastProvider = ToastFamily();

/// See also [toast].
class ToastFamily extends Family<ToastificationItem> {
  /// See also [toast].
  const ToastFamily();

  /// See also [toast].
  ToastProvider call({
    required ToastStyle style,
    required String message,
  }) {
    return ToastProvider(
      style: style,
      message: message,
    );
  }

  @override
  ToastProvider getProviderOverride(
    covariant ToastProvider provider,
  ) {
    return call(
      style: provider.style,
      message: provider.message,
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
  String? get name => r'toastProvider';
}

/// See also [toast].
class ToastProvider extends AutoDisposeProvider<ToastificationItem> {
  /// See also [toast].
  ToastProvider({
    required ToastStyle style,
    required String message,
  }) : this._internal(
          (ref) => toast(
            ref as ToastRef,
            style: style,
            message: message,
          ),
          from: toastProvider,
          name: r'toastProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$toastHash,
          dependencies: ToastFamily._dependencies,
          allTransitiveDependencies: ToastFamily._allTransitiveDependencies,
          style: style,
          message: message,
        );

  ToastProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.style,
    required this.message,
  }) : super.internal();

  final ToastStyle style;
  final String message;

  @override
  Override overrideWith(
    ToastificationItem Function(ToastRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ToastProvider._internal(
        (ref) => create(ref as ToastRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        style: style,
        message: message,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ToastificationItem> createElement() {
    return _ToastProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ToastProvider &&
        other.style == style &&
        other.message == message;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, style.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ToastRef on AutoDisposeProviderRef<ToastificationItem> {
  /// The parameter `style` of this provider.
  ToastStyle get style;

  /// The parameter `message` of this provider.
  String get message;
}

class _ToastProviderElement
    extends AutoDisposeProviderElement<ToastificationItem> with ToastRef {
  _ToastProviderElement(super.provider);

  @override
  ToastStyle get style => (origin as ToastProvider).style;
  @override
  String get message => (origin as ToastProvider).message;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
