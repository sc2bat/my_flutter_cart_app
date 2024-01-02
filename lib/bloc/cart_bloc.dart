import 'package:my_flutter_cart_app/model/item.dart';
import 'package:bloc/bloc.dart';

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

class CartBloc extends Bloc<CartEvent, List<Item>> {
  CartBloc() : super([]);

  Stream<List<Item>> mapEventToState(CartEvent cartEvent) async* {
    List<Item> newState = List.from(state);
    switch (cartEvent.cartEventType) {
      case CartEventType.add:
        newState.add(cartEvent.item);
        break;
      case CartEventType.remove:
        newState.remove(cartEvent.item);
        break;
    }
    // yield state;

    yield newState;
  }
}
