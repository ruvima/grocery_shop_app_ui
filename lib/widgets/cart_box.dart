import 'package:flutter/material.dart';

class CartBox extends StatelessWidget {
  final String name;
  final String subtotalPrice;
  final String image;
  final int quantity;
  final Color color;
  final bool show;
  final VoidCallback? onTap;
  const CartBox({
    Key? key,
    required this.name,
    required this.subtotalPrice,
    required this.image,
    required this.quantity,
    required this.color,
    this.onTap,
    this.show = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(5),
      height: 80,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '20 jun, 2022',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          Container(
            padding: const EdgeInsets.all(15.0),
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$ $subtotalPrice',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$quantity item',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          show
              ? IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.black54,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
