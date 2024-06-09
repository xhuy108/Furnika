import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnika/core/common/entities/city.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';
import 'package:furnika/features/profile/domain/entities/address.dart';
import 'package:furnika/features/profile/presentation/cubit/address_cubit.dart';
import 'package:furnika/features/profile/presentation/widgets/custom_dropdown_button.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AddressSheet extends StatefulWidget {
  const AddressSheet({super.key, required this.cities, this.address});

  final List<City> cities;
  final Address? address;

  @override
  State<AddressSheet> createState() => _AddressSheetState();
}

class _AddressSheetState extends State<AddressSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _streetController = TextEditingController();
  final _countryController = TextEditingController();
  City? _selectedCity;
  List<String> districts = [];
  String? _selectedDistrict;

  @override
  void initState() {
    super.initState();
    if (widget.address != null) {
      _nameController.text = widget.address!.customer;
      _phoneNumberController.text = widget.address!.phoneNumber;
      _streetController.text = widget.address!.detailedAddress;
      _selectedCity = widget.cities
          .where(
            (element) => element.name == widget.address!.city,
          )
          .first;
      districts = _selectedCity!.districts;
      _selectedDistrict = widget.address!.district;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
  }

  void submit() async {
    final isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      if (widget.address != null) {
        // context.read<AddressCubit>().updateAddressItem(
        //       AddressModel(
        //         id: widget.address!.id,
        //         customer: _nameController.text,
        //         phoneNumber: _phoneNumberController.text,
        //         country: _countryController.text,
        //         city: _selectedCity!.name,
        //         district: _selectedDistrict!,
        //         detailedAddress: _streetController.text,
        //       ),
        //     );
      } else {
        // context.read<AddressCubit>().addAddress(
        //       AddressModel(
        //         id: uuid.v4(),
        //         customer: _nameController.text,
        //         phoneNumber: _phoneNumberController.text,
        //         country: _countryController.text,
        //         city: _selectedCity!.name,
        //         district: _selectedDistrict!,
        //         detailedAddress: _streetController.text,
        //       ),
        //     );
      }
      if (!mounted) {
        return;
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    _countryController.text = 'Vietnam';

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          30,
          30,
          30,
          keyBoardSpace + 16,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextField(
                  controller: _nameController,
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  controller: _phoneNumberController,
                  hintText: 'Phone number',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required!';
                    }
                    var regExp = RegExp(r'^(?:[+0][1-9])?[0-9]{10}$');
                    if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid phone number!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  controller: _countryController,
                  hintText: 'Country',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdownButton(
                  value: _selectedCity,
                  hintText: 'City',
                  items: widget.cities
                      .map(
                        (city) => DropdownMenuItem(
                          value: city,
                          child: Text(city.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCity = value;
                      districts = _selectedCity!.districts;
                      _selectedDistrict = null;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'City is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdownButton(
                  value: _selectedDistrict,
                  hintText: 'District',
                  items: districts
                      .map(
                        (district) => DropdownMenuItem(
                          value: district,
                          child: Text(district),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedDistrict = value.toString();
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'District is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                    controller: _streetController,
                    hintText: 'Street',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Street is required!';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  width: double.infinity,
                  height: 45,
                  title: 'Save',
                  onTap: submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
