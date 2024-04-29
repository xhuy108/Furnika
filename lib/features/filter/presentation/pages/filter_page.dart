import 'package:flutter/material.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Filter'),
      body: const Center(
        child: Text('Filter Page'),
      ),
    );
  }
}
