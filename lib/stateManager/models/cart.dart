// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

import 'catalog.dart';

class CartModel extends ChangeNotifier {
  /// The current catalog. Used to construct items from numeric ids.
  final CatalogModel _catalog;

  /// 购物车中存放商品的 list，只存 id 就行
  final List<int> _itemIds;

  /// Construct a CartModel instance that is backed by a [CatalogModel] and
  /// an optional previous state of the cart.
  ///
  /// If [previous] is not `null`, it's items are copied to the newly
  /// constructed instance.
  CartModel(this._catalog, CartModel previous)
      : assert(_catalog != null),
        _itemIds = previous?._itemIds ?? [];



  /// 将存放商品 id 的数组转换为存放商品的数值，函数式编程。
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// 获取价格总和，dart 中的 List 中有两个累加的方法 reduce 和 fold,fold 可以提供一个初始值。
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  ///添加商品，这个方法时外界可以修改 list 的唯一途径
  void add(Item item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}
