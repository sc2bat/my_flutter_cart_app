import 'package:my_flutter_cart_app/model/item.dart';
// import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

enum CartEventType {
  add,
  remove,
}

class CartEvent {
  final CartEventType cartEventType;
  final Item item;

  CartEvent(
    this.cartEventType,
    this.item,
  );
}

class CartBloc {
  final itemList = [
    Item('qqqq', 30000),
    Item('wwwww', 80000),
    Item('eeeee', 70000),
    Item('ffff', 30000),
    Item('ddddddd', 60000),
    Item('aaaaaaaaa', 50000),
    Item('xxxxxx', 10000),
    Item('zzzzzz', 30000),
  ];

  final List<Item> _cartList = [];

  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]);
  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event) {
    switch (event.cartEventType) {
      case CartEventType.add:
        _cartList.add(event.item);
        break;
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
    }
    _cartListSubject.add(_cartList);
  }
}

// class CartBloc extends Bloc<CartEvent, List<Item>> {
//   CartBloc() : super([]) {
//     on<CartEvent>((event, emit) {
//       switch (event.cartEventType) {
//         case CartEventType.add:
//           state.add(event.item);
//           break;
//         case CartEventType.remove:
//           state.remove(event.item);
//           break;
//       }
//       emit(state);
//     });
//   }
// }

