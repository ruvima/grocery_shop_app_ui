import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_shop_app_ui/constants/constants.dart';
import 'package:grocery_shop_app_ui/provider/cart_provider.dart';
import 'package:grocery_shop_app_ui/provider/item_provider.dart';
import 'package:grocery_shop_app_ui/widgets/cart_box.dart';
import 'package:grocery_shop_app_ui/widgets/fruits_box.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider).items;
    final cartItems = ref.watch(cartProvider);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.location_on_outlined),
                  Text(
                    'Sylhet, Bangladesh',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(Constants.avatar),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Good morning, Mate',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(right: 100),
                child: const Text(
                  "Let's order fresh items for you",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Buy fresh items',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return FruitsBox(
                        name: item.name,
                        price: '\$ ${item.price}',
                        image: item.image,
                        color: item.color,
                        onTap: () => ref.read(cartProvider).addItem(item),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cartItems.cartList.isEmpty
                      ? const Text(
                          'My orders',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          'My orders : ${cartItems.cartList.length} products',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/cart'),
                    child: const Text(
                      'Go to cart',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItems.cartList.length,
                    itemBuilder: (context, index) {
                      final item = cartItems.cartList[index];
                      return CartBox(
                        name: item.name,
                        price: item.price.toString(),
                        image: item.image,
                        count: item.count.toString(),
                        color: item.color,
                        onTap: () {},
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
