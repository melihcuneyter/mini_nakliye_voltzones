import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../l10n/app_localizations.dart';
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

  @override
  void dispose() {
    _baslangicController.dispose();
    _bitisController.dispose();
    _yukAgirligiController.dispose();
    super.dispose();
  }

  double _calculatePrice(String vehicleType, String weight) {
    final weightValue = double.tryParse(weight) ?? 0;

    final pricePerKg = {
      'Minivan': 15.0,
      'Panelvan': 12.0,
      'Van': 10.0,
      'Truck': 8.0,
    };

    return (pricePerKg[vehicleType] ?? 0) * weightValue;
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
          final t = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.orderCreated)));

          _baslangicController.clear();
          _bitisController.clear();
          _yukAgirligiController.clear();
          setState(() {
            _selectedAracTipi = 'Minivan';
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Hata: $e')));
        }
      }
    }
  }

  String _getTranslatedVehicle(BuildContext context, String key) {
    final t = AppLocalizations.of(context)!;
    switch (key) {
      case 'Minivan':
        return t.minivan;
      case 'Panelvan':
        return t.panelvan;
      case 'Van':
        return t.van;
      case 'Truck':
        return t.truck;
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final aracTipleri = ['Minivan', 'Panelvan', 'Van', 'Truck'];

    return Scaffold(
      appBar: AppBar(title: Text(t.createOrder), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _baslangicController,
                decoration: InputDecoration(
                  labelText: t.startLocation,
                  hintText: t.startLocationHint,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.pleaseEnterStartLocation;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _bitisController,
                decoration: InputDecoration(
                  labelText: t.endLocation,
                  hintText: t.endLocationHint,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.pleaseEnterEndLocation;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _selectedAracTipi,
                decoration: InputDecoration(
                  labelText: t.vehicleType,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.local_shipping),
                ),
                items: aracTipleri.map((arac) {
                  return DropdownMenuItem(
                    value: arac,
                    child: Text(_getTranslatedVehicle(context, arac)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAracTipi = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _yukAgirligiController,
                decoration: InputDecoration(
                  labelText: t.loadWeight,
                  hintText: t.loadWeightHint,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.scale),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.pleaseEnterLoadWeight;
                  }
                  if (double.tryParse(value) == null) {
                    return t.pleaseEnterValidNumber;
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Tahmini Fiyat Gösterimi
              ValueListenableBuilder(
                valueListenable: _yukAgirligiController,
                builder: (context, value, child) {
                  final price = _calculatePrice(_selectedAracTipi, value.text);

                  if (value.text.isNotEmpty &&
                      double.tryParse(value.text) != null) {
                    return Card(
                      color: Colors.blue.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.payments,
                                  color: Colors.blue.shade700,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  t.estimatedPrice,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '₺${price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _createOrder,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  t.createOrder,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
