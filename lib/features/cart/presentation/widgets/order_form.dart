import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/core/app/store/order_form/order_form_store.dart'; // Ensure this path is correct

class OrderForm extends StatelessWidget {
  final UserData userData;
  final OrderFormStore orderFormStore;

  const OrderForm(
      {super.key, required this.userData, required this.orderFormStore});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      title: const Text(
        'Оформление заказа',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(
            builder: (_) => Column(
              children: userData.cartItems.map((item) {
                return Text(
                  '${item['name']} - ${item['price']}\$ x ${item['count']}',
                  style: const TextStyle(color: Colors.white),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Observer(
            builder: (_) => Text(
              'Итого: ${userData.totalprice}\$',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Observer(
            builder: (_) => DropdownButton<String>(
              value: orderFormStore.paymentMethod,
              dropdownColor: const Color.fromARGB(255, 35, 27, 144),
              items: [
                DropdownMenuItem<String>(
                  value: 'cash',
                  child: Text(
                    'Наличные',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                ...userData.cardList.map((String card) {
                  return DropdownMenuItem<String>(
                    value: card,
                    child: Text(
                      card,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ],
              onChanged: (String? newValue) {
                orderFormStore.setPaymentMethod(newValue!);
              },
            ),
          ),
          const SizedBox(height: 10),
          Observer(
            builder: (_) => DropdownButton<String>(
              value: orderFormStore.selectedAddress ??
                  (userData.addressList.isNotEmpty
                      ? userData.addressList.first
                      : ''),
              dropdownColor: const Color.fromARGB(255, 35, 27, 144),
              items: userData.addressList.map((String address) {
                return DropdownMenuItem<String>(
                  value: address,
                  child: Text(
                    address,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (String? newAddress) {
                orderFormStore.setSelectedAddress(newAddress);
              },
            ),
          ),
          const SizedBox(height: 10),
          // Add TextField for user comment
          Observer(
            builder: (_) => TextField(
              decoration: InputDecoration(
                hintText: 'Введите комментарий',
                hintStyle: const TextStyle(color: Colors.white54),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await userData.placeOrder(
                orderFormStore.paymentMethod, orderFormStore.selectedAddress);
            await userData
                .sendOrderConfirmationEmail(userData.user!.email.toString());
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
            showDialog(
              // ignore: use_build_context_synchronously
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 35, 27, 144),
                content: const Text(
                  'Заказ успешно оформлен!',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Отлично',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
          child: const Text(
            'Оформить заказ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}


//axM7tRUwJcndJ4d

