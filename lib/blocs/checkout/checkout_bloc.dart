import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/models/cart_model.dart';
import 'package:flutter_ecommerce_app/models/checkout_model.dart';
import 'package:flutter_ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce_app/repositories/checkout/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository? _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString,
              )
            : CheckoutLoading()) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
  }

// STREAM - mapEventToState
  @override
  Stream<CheckoutState> mapEventToState(
    CheckoutEvent event,
  ) async* {
    // event update checkout
    if (event is UpdateCheckout) {
      yield* _mapUpdateCheckoutToState(event, state);
    }

    // event confirm checkout
    if (event is ConfirmCheckout) {
      yield* _mapConfirmCheckoutToState(event, state);
    }
  }

// STREAM - mapUpdateCheckoutToState
  Stream<CheckoutState> _mapUpdateCheckoutToState(
    UpdateCheckout event,
    CheckoutState state,
  ) async* {
    if (state is CheckoutLoaded) {
      yield CheckoutLoaded(
        email: event.email ?? state.email,
        fullName: event.fullName ?? state.fullName,
        products: event.cart?.products ?? state.products,
        deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
        subtotal: event.cart?.subtotalString ?? state.subtotal,
        total: event.cart?.totalString ?? state.total,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipCode: event.zipCode ?? state.zipCode,
      );
    }
  }

  // STREAM - mapConfirmCheckoutToState
  Stream<CheckoutState> _mapConfirmCheckoutToState(
    ConfirmCheckout event,
    CheckoutState state,
  ) async* {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository!.addCheckout(event.checkout);
        // ignore: avoid_print
        print(':::::: done');
        yield CheckoutLoading();
      } catch (_) {}
    }
  }
}
