import 'package:flutter/material.dart';

import '../models/chart_data.dart';

class ChartDatas with ChangeNotifier {
  List<ChartData> _chartdata = [];

  List<ChartData> get chartdata => _chartdata;

  Future<void> getData() async {
    print('getData');
    _chartdata = [
      ChartData('1', 12, 18, 17, 15, 13),
      ChartData('2', 12, 18, 15, 17, 13),
      ChartData('3', 12, 18, 17, 15, 13),
      ChartData('4', 12, 18, 17, 15, 13),
      ChartData('5', 12, 18, 17, 15, 13),
      ChartData('6', 12, 18, 17, 15, 13),
      ChartData('7', 12, 18, 17, 15, 13),
      ChartData('8', 12, 18, 17, 15, 13),
      ChartData('9', 12, 18, 17, 15, 13),
      ChartData('10', 12, 18, 17, 15, 13),
      ChartData('11', 12, 18, 17, 15, 13),
      ChartData('12', 12, 18, 17, 15, 13),
      ChartData('13', 12, 18, 17, 15, 13),
      ChartData('14', 12, 18, 17, 15, 13),
      ChartData('15', 12, 18, 17, 15, 13),
      ChartData('16', 12, 18, 17, 15, 13),
      ChartData('17', 12, 18, 17, 15, 50),
    ];

    notifyListeners();
  }

// List<Product> _items = [];
// List<ProductCart> _cartItems = [];
// List<Category> _categoryItems = [];
// List<String> filterTitle = [];
//
// String searchEndPoint = '';
//
// String searchKey = '';
// var _sPage = 1;
// var _sPerPage = 10;
// var _sOrder = 'desc';
// var _sOrderBy = 'date';
//
// var _sCategory;
//
// set cartItems(List<ProductCart> value) {
//   _cartItems = value;
// }
//
// bool _isFiltered = false;
//
// SearchDetail _searchDetails = SearchDetail(max_page: 1, total: 10);
//
// Future<void> checkFiltered() async {
//   if (_sCategory == '') {
//     _isFiltered = false;
//   } else {
//     _isFiltered = true;
//   }
// }
//
// void searchBuilder() {
//   if (!(searchKey == '')) {
//     searchEndPoint = '';
//
//     searchEndPoint = searchEndPoint + '?search=$searchKey';
//     searchEndPoint = searchEndPoint + '&page=$_sPage&per_page=$_sPerPage';
//   } else {
//     searchEndPoint = '';
//
//     searchEndPoint = searchEndPoint + '?page=$_sPage&per_page=$_sPerPage';
//   }
//   if (!(_sOrder == '')) {
//     searchEndPoint = searchEndPoint + '&order=$_sOrder';
//   }
//   if (!(_sOrderBy == '')) {
//     searchEndPoint = searchEndPoint + '&orderby=$_sOrderBy';
//   }
//
//   if (!(_sCategory == '' || _sCategory == null)) {
//     searchEndPoint = searchEndPoint + '&category=$_sCategory';
//   }
//   print(searchEndPoint);
// }
//
// static Product _itemZero = Product();
// Product _item = _itemZero;
//
// String _token;
//
// List<Product> get items {
//   return _items;
// }
//
// int get cartItemsCount {
//   return _cartItems.length;
// }
//
// Product get item {
//   return _item;
// }
//
// List<ProductCart> get cartItems {
//   return _cartItems;
// }
//
// get sCategory => _sCategory;
//
// set sCategory(value) {
//   _sCategory = value;
// }
//
// Future<void> addShopCart(
//   Product product,
//   ColorCodeProductDetail colorId,
//   int quantity,
// ) async {
//   print('addShopCart');
//   try {
//     _cartItems.add(ProductCart(
//         id: product.id,
//         title: product.name,
//         price: product.price,
//         featured_media_url: product.featured_image.sizes.medium,
//         productCount: quantity));
//     notifyListeners();
//   } catch (error) {
//     print(error.toString());
//     throw (error);
//   }
// }
//
// Future<void> updateShopCart(ProductCart product, ColorCodeCard colorId,
//     int quantity, bool isLogin) async {
//   print('updateShopCart');
//   try {
//     _cartItems.firstWhere((prod) => prod.id == product.id).productCount =
//         quantity;
//     notifyListeners();
//   } catch (error) {
//     print(error.toString());
//     throw (error);
//   }
// }
//
// Future<void> removeShopCart(int productId) async {
//   print('removeShopCart');
//
//   try {
//     _cartItems.remove(_cartItems.firstWhere((prod) => prod.id == productId));
//     notifyListeners();
//   } catch (error) {
//     print(error.toString());
//     throw (error);
//   }
// }
//
// Product findById() {
//   return _item;
// }
//
// Future<void> retrieveCategory() async {
//   print('fetchAndSetHomeData');
//
//   final url = Urls.rootUrl + Urls.categoriesEndPoint;
//   print(url);
//
//   try {
//     final response = await get(Uri.parse(url), headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     });
//
//     final extractedData = json.decode(response.body) as List<dynamic>;
//     print(extractedData);
//
//     List<Category> categories =
//         extractedData.map((i) => Category.fromJson(i)).toList();
//     print(categories[0].name);
//
//     _categoryItems = categories;
//     notifyListeners();
//   } catch (error) {
//     print(error.toString());
//     throw (error);
//   }
// }
//
// Future<void> searchItem() async {
//   print('searchItem');
//
//   final url = Urls.rootUrl + Urls.productsEndPoint + '$searchEndPoint';
//   print(url);
//
//   try {
//     final response = await get(Uri.parse(url), headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     });
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       final extractedData = json.decode(response.body);
//       print(extractedData.toString());
//
//       ProductMain productMain = ProductMain.fromJson(extractedData);
//       print(productMain.productsDetail.max_page.toString());
//
//       _items = productMain.products;
//       _searchDetails = productMain.productsDetail;
//     } else {
//       _items = [];
//     }
//     notifyListeners();
//   } catch (error) {
//     print(error.toString());
//     throw (error);
//   }
// }
//
// Future<void> retrieveItem(int productId) async {
//   print('retrieveItem');
//
//   final url = Urls.rootUrl + Urls.productsEndPoint + "/$productId";
//   print(url);
//
//   try {
//     final response = await get(Uri.parse(url), headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     });
//     final extractedData = json.decode(response.body) as dynamic;
//     print(extractedData);
//
//     Product product = Product.fromJson(extractedData);
//     print(product.id.toString());
//     print(product.description.toString());
//
//     _item = product;
//   } catch (error) {
//     print(error.toString());
//     throw (error);
//   }
//   notifyListeners();
// }
//
// set sPerPage(value) {
//   _sPerPage = value;
// }
//
// set sOrder(value) {
//   _sOrder = value;
// }
//
// set sOrderBy(value) {
//   _sOrderBy = value;
// }
//
// set sPage(value) {
//   _sPage = value;
// }
//
// bool get isFiltered => _isFiltered;
//
// SearchDetail get searchDetails => _searchDetails;
//
// set item(Product value) {
//   _item = value;
// }
//
// Product get itemZero => _itemZero;
//
// List<Category> get categoryItems => _categoryItems;
//
// Future<void> sendRequest(
//   OrderSendDetails request,
// ) async {
//   print('sendRequestOrder');
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     _token = prefs.getString('token');
//     print('tooookkkeeennnnnn  $_token');
//
//     final url = Urls.rootUrl + Urls.orderEndPoint;
//     print('url  $url');
//     print(jsonEncode(request));
//
//     final response = await post(Uri.parse(url),
//         headers: {
//           'Authorization': 'Bearer $_token',
//           'Content-Type': 'application/json',
//           'Accept': 'application/json'
//         },
//         body: jsonEncode(request));
//
//     final extractedData = json.decode(response.body);
//     print(extractedData);
//
//     print('qqqqqqqqqqqqqqggggggggq11111111111');
//
//     notifyListeners();
//   } catch (error) {
//     print(error.toString());
//     throw (error);
//   }
// }
}
