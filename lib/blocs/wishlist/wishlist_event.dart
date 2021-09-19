part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

// start wishlist product
class StartWishlist extends WishlistEvent {}

// add wishlist product
class AddWishlistProduct extends WishlistEvent {
  final Product product;

  const AddWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}

// remove wishlist product
class RemoveWishlistProduct extends WishlistEvent {
  final Product product;

  const RemoveWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}
