// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dev_coin_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getStockDataHash() => r'a7b2032fe81357f3ec520fb894e20267b2bfc1af';

/// See also [getStockData].
@ProviderFor(getStockData)
final getStockDataProvider = AutoDisposeFutureProvider<bool>.internal(
  getStockData,
  name: r'getStockDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getStockDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetStockDataRef = AutoDisposeFutureProviderRef<bool>;
String _$getNameHash() => r'0a29733b7ac3d01d1691cb5878799e6ead5643b3';

/// See also [getName].
@ProviderFor(getName)
final getNameProvider = AutoDisposeProvider<String>.internal(
  getName,
  name: r'getNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetNameRef = AutoDisposeProviderRef<String>;
String _$priceChangeHash() => r'acc509072c475ed343916bbd646d38bb094b87b4';

/// See also [PriceChange].
@ProviderFor(PriceChange)
final priceChangeProvider =
    AutoDisposeNotifierProvider<PriceChange, double>.internal(
  PriceChange.new,
  name: r'priceChangeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$priceChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PriceChange = AutoDisposeNotifier<double>;
String _$stockDataListHash() => r'495409fb733dab2ec231f373935cb06eed267bd4';

/// See also [StockDataList].
@ProviderFor(StockDataList)
final stockDataListProvider =
    NotifierProvider<StockDataList, List<Stockdata>>.internal(
  StockDataList.new,
  name: r'stockDataListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stockDataListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StockDataList = Notifier<List<Stockdata>>;
String _$selectedStockDataHash() => r'6fc2488012f1a94562b59fee57ac747334b002c4';

/// See also [SelectedStockData].
@ProviderFor(SelectedStockData)
final selectedStockDataProvider =
    NotifierProvider<SelectedStockData, Stockdata?>.internal(
  SelectedStockData.new,
  name: r'selectedStockDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedStockDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedStockData = Notifier<Stockdata?>;
String _$carDataHash() => r'143587ead8b6e2b174cdd116fad8b9db06ea385f';

/// See also [CarData].
@ProviderFor(CarData)
final carDataProvider = AutoDisposeNotifierProvider<CarData, Car>.internal(
  CarData.new,
  name: r'carDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$carDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarData = AutoDisposeNotifier<Car>;
String _$personNameHash() => r'1542f0518439f43f7256767e3622a20c48957174';

/// See also [PersonName].
@ProviderFor(PersonName)
final personNameProvider =
    AutoDisposeNotifierProvider<PersonName, List<String>>.internal(
  PersonName.new,
  name: r'personNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$personNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PersonName = AutoDisposeNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
