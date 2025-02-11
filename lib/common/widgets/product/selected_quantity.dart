import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/cubit/product/product_quantity_cubit.dart';
import 'package:shoppingcart/common/widgets/button/basic_app_button.dart';

class SelectedQuantity extends StatefulWidget {
  final String name;
  final int? initialQuantity;
  final bool isCubit;
  final Function(int)? onSubmit;
  const SelectedQuantity({
    Key? key,
    required this.name,
    this.initialQuantity,
    required this.isCubit,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<SelectedQuantity> createState() => _SelectedQuantityState();
}

class _SelectedQuantityState extends State<SelectedQuantity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();

  bool isValidate = true;

  void onChanged() {
    setState(() {
      isValidate = _formKey.currentState!.validate();
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.isCubit) {
      _quantityController.text =
          context.read<ProductQuantityCubit>().state.toString();
    } else {
      _quantityController.text = widget.initialQuantity.toString();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          onChanged: onChanged,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameProduct(),
              const SizedBox(height: 10),
              _quantityField(),
              const SizedBox(height: 16),
              _buttonSubmit()
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameProduct() {
    return Text(
      widget.name,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _quantityField() {
    return TextFormField(
      controller: _quantityController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      validator: (value) {
        int? number = int.tryParse(value ?? '');
        if (number == null || number <= 0) {
          return 'Quantity must be greater than 0';
        }
        if (number > 999) {
          return 'Quantity cannot exceed 999';
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return BasicAppButton(
      onPressed: isValidate
          ? () {
              int newQuantity = int.parse(_quantityController.text);
              if (widget.isCubit) {
                context.read<ProductQuantityCubit>().newQuantity(newQuantity);
              } else {}

              Navigator.pop(context);
            }
          : null,
      title: 'Submit',
    );
  }
}
