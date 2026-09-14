import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:quanlymaygiat/core/utils/currency.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/service_entity.dart';
import 'package:quanlymaygiat/features/devices/presentation/cubit/create_device_cubit.dart';
import 'package:quanlymaygiat/features/devices/presentation/widgets/owner_picker.dart';
import 'package:quanlymaygiat/features/devices/presentation/widgets/service_form_sheet.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

@RoutePage()
class CreateDeviceScreen extends BasePage<CreateDeviceCubit, CreateDeviceState> {
  const CreateDeviceScreen({super.key});

  @override
  List<BlocProvider> get providers => [
    BlocProvider<CreateDeviceCubit>(
      create: (_) => getIt<CreateDeviceCubit>()..init(),
    ),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return BlocListener<CreateDeviceCubit, CreateDeviceState>(
      listenWhen: (p, c) => p.didCreate != c.didCreate,
      listener: (context, state) {
        if (state.didCreate) context.router.maybePop(true);
      },
      child: const AppScaffold(
        appBar: BaseAppBar(title: 'Thêm thiết bị'),
        body: _CreateDeviceForm(),
      ),
    );
  }
}

class _CreateDeviceForm extends StatefulWidget {
  const _CreateDeviceForm();

  @override
  State<_CreateDeviceForm> createState() => _CreateDeviceFormState();
}

class _CreateDeviceFormState extends State<_CreateDeviceForm> {
  final _deviceNameController = TextEditingController();
  final _deviceFullNameController = TextEditingController();
  final _deviceIdController = TextEditingController();
  final _deviceTypeController = TextEditingController();
  final _machineTypeController = TextEditingController();
  final _addressController = TextEditingController();
  final _percentController = TextEditingController();

  @override
  void dispose() {
    _deviceNameController.dispose();
    _deviceFullNameController.dispose();
    _deviceIdController.dispose();
    _deviceTypeController.dispose();
    _machineTypeController.dispose();
    _addressController.dispose();
    _percentController.dispose();
    super.dispose();
  }

  Future<void> _pickOwner() async {
    final cubit = context.read<CreateDeviceCubit>();
    final selected = await showOwnerPicker(context, cubit.state.owners);
    if (selected != null) cubit.selectOwner(selected);
  }

  Future<void> _addService() async {
    final cubit = context.read<CreateDeviceCubit>();
    final service = await showServiceForm(context);
    if (service != null) cubit.addService(service);
  }

  Future<void> _editService(int index, ServiceEntity service) async {
    final cubit = context.read<CreateDeviceCubit>();
    final updated = await showServiceForm(context, initial: service);
    if (updated != null) cubit.updateServiceAt(index, updated);
  }

  void _submit() {
    context.read<CreateDeviceCubit>().submit(
      deviceName: _deviceNameController.text,
      deviceFullName: _deviceFullNameController.text,
      deviceID: _deviceIdController.text,
      deviceType: _deviceTypeController.text,
      machineType: _machineTypeController.text,
      address: _addressController.text,
      percentText: _percentController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateDeviceCubit, CreateDeviceState>(
      builder: (context, state) {
        final cubit = context.read<CreateDeviceCubit>();
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20.s, 16.s, 20.s, 24.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppDropdownField(
                      label: 'Chủ sở hữu',
                      isRequired: true,
                      valueLabel: state.selectedOwner == null
                          ? null
                          : (state.selectedOwner!.fullName.isNotEmpty
                                ? state.selectedOwner!.fullName
                                : state.selectedOwner!.username),
                      hint: 'Chọn chủ sở hữu',
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        size: 20.s,
                        color: AppColors.textTertiary,
                      ),
                      onTap: _pickOwner,
                    ),
                    Gap(16.s),
                    AppTextField(
                      label: 'Tên thiết bị',
                      isRequired: true,
                      controller: _deviceNameController,
                      hint: 'VD: Máy giặt số 1',
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(16.s),
                    AppTextField(
                      label: 'Tên đầy đủ',
                      controller: _deviceFullNameController,
                      hint: 'VD: Máy giặt Toshiba tầng 1',
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(16.s),
                    AppTextField(
                      label: 'Mã thiết bị',
                      isRequired: true,
                      controller: _deviceIdController,
                      hint: 'VD: DEVICE_001',
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(16.s),
                    AppTextField(
                      label: 'Loại thiết bị',
                      controller: _deviceTypeController,
                      hint: 'VD: Máy giặt',
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(16.s),
                    AppTextField(
                      label: 'Loại máy',
                      controller: _machineTypeController,
                      hint: 'VD: Công nghiệp',
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(16.s),
                    AppTextField(
                      label: 'Địa chỉ',
                      controller: _addressController,
                      hint: 'Nhập địa chỉ đặt máy',
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(16.s),
                    AppTextField(
                      label: 'Phần trăm ứng dụng thu (%)',
                      controller: _percentController,
                      hint: 'VD: 10',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      textInputAction: TextInputAction.done,
                    ),
                    Gap(24.s),
                    _ServicesSection(
                      services: state.services,
                      onAdd: _addService,
                      onEdit: _editService,
                      onRemove: cubit.removeServiceAt,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.s, 12.s, 20.s, 16.s),
              child: AppButton(
                label: 'Thêm thiết bị',
                loading: state.isSubmitting,
                onPressed: _submit,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ServicesSection extends StatelessWidget {
  const _ServicesSection({
    required this.services,
    required this.onAdd,
    required this.onEdit,
    required this.onRemove,
  });

  final List<ServiceEntity> services;
  final VoidCallback onAdd;
  final void Function(int index, ServiceEntity service) onEdit;
  final ValueChanged<int> onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              'Dịch vụ',
              style: TextStyle(
                fontSize: 16.s,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Gap(8.s),
            Text(
              '(${services.length})',
              style: TextStyle(fontSize: 14.s, color: AppColors.textSecondary),
            ),
          ],
        ),
        Gap(12.s),
        if (services.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.s),
            child: Text(
              'Chưa có dịch vụ nào',
              style: TextStyle(fontSize: 13.5.s, color: AppColors.textTertiary),
            ),
          )
        else
          for (var i = 0; i < services.length; i++) ...[
            _ServiceCard(
              service: services[i],
              onTap: () => onEdit(i, services[i]),
              onRemove: () => onRemove(i),
            ),
            Gap(10.s),
          ],
        Gap(4.s),
        AppButton(
          label: 'Thêm dịch vụ',
          variant: AppButtonVariant.outlined,
          icon: Icons.add_rounded,
          onPressed: onAdd,
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.service,
    required this.onTap,
    required this.onRemove,
  });

  final ServiceEntity service;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.symmetric(horizontal: 14.s, vertical: 12.s),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.s),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(12.s),
            ),
            child: Icon(
              Icons.local_laundry_service_rounded,
              color: AppColors.primary,
              size: 20.s,
            ),
          ),
          Gap(12.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.serviceName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.s,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Gap(2.s),
                Text(
                  '${CurrencyUtils.formatVnd(service.price)} · ${service.totalMinutes} phút',
                  style: TextStyle(
                    fontSize: 13.s,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Gap(8.s),
          AppIconButton(
            icon: Icons.delete_outline_rounded,
            color: AppColors.error,
            backgroundColor: AppColors.errorSoft,
            tooltip: 'Xóa dịch vụ',
            onTap: onRemove,
          ),
        ],
      ),
    );
  }
}
