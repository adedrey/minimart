import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minimart/core/providers/products/product_vm.dart';
import 'package:minimart/core/providers/repositories/product/product_repo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_vm.freezed.dart';
part 'home_vm.g.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.failure(String? errorMessage) = Failure;
  const factory HomeState.success() = Success;
}

@Riverpod(keepAlive: true)
class HomeVM extends _$HomeVM {
  @override
  HomeState build() {
    return const HomeState.initial();
  }

  Future<void> fetchProducts() async {
    state = const HomeState.loading();
    final result = await ref.read(productRepositoryProvider).fetchProducts();
    result.fold((failure) => state = HomeState.failure(failure.error.message),
        (success) {
      ref.read(productVMProvider.notifier).products = success.data;
      state = const HomeState.success();
    });
  }
}
