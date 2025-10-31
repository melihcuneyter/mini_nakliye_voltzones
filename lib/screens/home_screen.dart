import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order_model.dart' as models;
import '../providers/order_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _baslangicController = TextEditingController();
  final _bitisController = TextEditingController();
  final _yukAgirligiController = TextEditingController();
  
  String _selectedAracTipi = 'Minivan';
  final List<String> _aracTipleri = ['Minivan', 'Panelvan', 'Kamyonet', 'TIR'];

  @override
  void dispose() {
    _baslangicController.dispose();
    _bitisController.dispose();
    _yukAgirligiController.dispose();
    super.dispose();
  }

  void _createOrder() async {
    if (_formKey.currentState!.validate()) {
      final order = models.Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        baslangic: _baslangicController.text,
        bitis: _bitisController.text,
        aracTipi: _selectedAracTipi,
        yukAgirligi: _yukAgirligiController.text,
        tarih: DateTime.now(),
      );

      try {
        await ref.read(orderActionsProvider).addOrder(order);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sipariş başarıyla oluşturuldu!')),
          );
          
          // Formu temizle
          _baslangicController.clear();
          _bitisController.clear();
          _yukAgirligiController.clear();
          setState(() {
            _selectedAracTipi = 'Minivan';
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Hata: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sipariş Oluştur'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Başlangıç Konumu
              TextFormField(
                controller: _baslangicController,
                decoration: const InputDecoration(
                  labelText: 'Başlangıç Konumu',
                  hintText: 'Örn: İstanbul, Kadıköy',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen başlangıç konumu girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Bitiş Konumu
              TextFormField(
                controller: _bitisController,
                decoration: const InputDecoration(
                  labelText: 'Bitiş Konumu',
                  hintText: 'Örn: Ankara, Çankaya',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bitiş konumu girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Araç Tipi Dropdown
              DropdownButtonFormField<String>(
                initialValue: _selectedAracTipi,
                decoration: const InputDecoration(
                  labelText: 'Araç Tipi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_shipping),
                ),
                items: _aracTipleri.map((arac) {
                  return DropdownMenuItem(
                    value: arac,
                    child: Text(arac),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAracTipi = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Yük Ağırlığı
              TextFormField(
                controller: _yukAgirligiController,
                decoration: const InputDecoration(
                  labelText: 'Yük Ağırlığı (kg)',
                  hintText: 'Örn: 500',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.scale),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen yük ağırlığı girin';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Lütfen geçerli bir sayı girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Sipariş Oluştur Butonu
              ElevatedButton(
                onPressed: _createOrder,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Sipariş Oluştur',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}