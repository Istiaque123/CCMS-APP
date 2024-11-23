import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfessionScreen extends ConsumerStatefulWidget {
  const ProfessionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends ConsumerState<ProfessionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
      ),
    );
  }
}