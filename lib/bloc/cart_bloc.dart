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
  CartBloc() : super([]) {
    on<CartEvent>((event, emit) {
      switch (event.cartEventType) {
        case CartEventType.add:
          state.add(event.item);
          break;
        case CartEventType.remove:
          state.remove(event.item);
          break;
      }
      emit(state);
    });
  }
}


// /// Notifies bloc to increment state.
// class CartEventAdd extends CartEvent {
//   CartEventAdd(super.cartEventType, super.item);
// }

// /// Notifies bloc to decrement state.
// class CartEventRemove extends CartEvent {
//   CartEventRemove(super.cartEventType, super.item);
// }

// /// {@template counter_bloc}
// /// A simple [Bloc] that manages an `int` as its state.
// /// {@endtemplate}
// class CounterBloc extends Bloc<CartEvent, List<Item>> {
//   /// {@macro counter_bloc}
//   CounterBloc() : super([]) {
//     on<CartEventAdd>((event, emit) => emit(state.add()));
//     on<CartEventRemove>((event, emit) => emit(state.remove()));
//   }
// }


//   class  mapEventToState extends CartEvent(
//     //   CartEvent cartEvent, Emitter<List<Item>> emit) async {
//     // switch (cartEvent.cartEventType) {
//     //   case CartEventType.add:
//     //     state.add(cartEvent.item);
//     //     break;
//     //   case CartEventType.remove:
//     //     state.remove(cartEvent.item);
//     //     break;
//     // }
//     // emit(state);
//   }