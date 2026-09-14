import 'package:flutter/services.dart';
import 'package:quanlymaygiat/core/utils/currency.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/service_entity.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

/// Opens a bottom sheet to create or edit a [ServiceEntity]. Pass [initial] to
/// pre-fill the form for editing. Pops with the resulting [ServiceEntity] when
/// "Lưu" is tapped, or `null` if dismissed.
Future<ServiceEntity?> showServiceForm(
  BuildContext context, {
  ServiceEntity? initial,
}) {
  return AppBottomSheet.show<ServiceEntity>(
    context,
    title: initial == null ? 'Thêm dịch vụ' : 'Sửa dịch vụ',
    body: _ServiceFormBody(initial: initial),
  );
}

class _ServiceFormBody extends StatefulWidget {
  const _ServiceFormBody({this.initial});

  final ServiceEntity? initial;

  @override
  State<_ServiceFormBody> createState() => _ServiceFormBodyState();
}

class _ServiceFormBodyState extends State<_ServiceFormBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _minutesController;
  String? _nameError;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    _nameController = TextEditingController(text: initial?.serviceName ?? '');
    _priceController = TextEditingController(
      text: initial == null || initial.price == 0 ? '' : '${initial.price}',
    );
    _minutesController = TextEditingController(
      text: initial == null || initial.totalMinutes == 0
          ? ''
          : '${initial.totalMinutes}',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _nameError = 'Vui lòng nhập tên dịch vụ');
      return;
    }
    final service = ServiceEntity(
      id: widget.initial?.id ?? '',
      serviceName: name,
      price: CurrencyUtils.parseAmount(_priceController.text),
      totalMinutes: int.tryParse(_minutesController.text.trim()) ?? 0,
    );
    Navigator.of(context).pop(service);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.s, 4.s, 20.s, 20.s),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            label: 'Tên dịch vụ',
            hint: 'VD: Giặt thường',
            controller: _nameController,
            isRequired: true,
            errorText: _nameError,
            textInputAction: TextInputAction.next,
            onChanged: (_) {
              if (_nameError != null) setState(() => _nameError = null);
            },
          ),
          Gap(16.s),
          AppTextField(
            label: 'Giá (đ)',
            hint: 'VD: 15000',
            controller: _priceController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.next,
          ),
          Gap(16.s),
          AppTextField(
            label: 'Thời lượng (phút)',
            hint: 'VD: 30',
            controller: _minutesController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _save(),
          ),
          Gap(24.s),
          AppButton(label: 'Lưu', onPressed: _save),
        ],
      ),
    );
  }
}
