import 'package:go_router/go_router.dart';

import '../../src/products/presentation/screens/product_add_screen.dart';
import '../../src/products/presentation/screens/products_screen.dart';

final appRouter = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    name: ProductsScreen.routeName,
    builder: (_, __) => const ProductsScreen(),
  ),
  GoRoute(
    path: '/home/add',
    name: ProductAddScreen.routeName,
    builder: (_, __) => const ProductAddScreen(),
  ),
  GoRoute(
    path: '/',
    redirect: (_, __) => '/home',
  ),
]);


/* 
Exception has occurred.
_AssertionError ('package:go_router/src/router.dart': Failed assertion: line 174 pos 18: 
  '!route.path.startsWith('/') && !route.path.endsWith('/')': sub-route path may not start or end 
  with "/": GoRoute#80c67(name: "product-item", path: "/product/:id"))
 */