import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:quanlymaygiat/app_router.dart';
import 'package:quanlymaygiat/core/config/app_config.dart';
import 'package:quanlymaygiat/core/utils/currency.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/device_entity.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/service_entity.dart';
import 'package:quanlymaygiat/features/devices/presentation/cubit/device_detail_cubit.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

@RoutePage()
class DeviceDetailScreen
    extends BasePage<DeviceDetailCubit, DeviceDetailState> {
  const DeviceDetailScreen({super.key, required this.device});

  final DeviceEntity device;

  @override
  List<BlocProvider> get providers => [
    BlocProvider<DeviceDetailCubit>(
      create: (_) => getIt<DeviceDetailCubit>(param1: device)..init(),
    ),
  ];

  @override
  Widget buildContent(BuildContext context) {
    final isAdmin = getIt<AuthLocalStore>().currentUser?.isAdmin ?? false;

    return BlocBuilder<DeviceDetailCubit, DeviceDetailState>(
      builder: (context, state) {
        final device = state.device;
        return AppScaffold(
          appBar: BaseAppBar(title: device.displayName),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _HeaderCard(device: device),
                Gap(16.s),
                _LinksCard(device: device),
                Gap(16.s),
                _InfoCard(device: device, ownerName: state.ownerName),
                Gap(16.s),
                _ServicesSection(services: device.services),
                Gap(16.s),
              ],
            ),
          ),
          bottomBar: isAdmin ? _EditBar(isSaving: state.isSaving) : null,
        );
      },
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.device});

  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    final isOn = device.isOn;
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 64.s,
            height: 64.s,
            decoration: BoxDecoration(
              color: isOn ? AppColors.successSoft : AppColors.primarySoft,
              borderRadius: BorderRadius.circular(18.s),
            ),
            child: Icon(
              Icons.local_laundry_service_rounded,
              color: isOn ? AppColors.statusRunning : AppColors.primary,
              size: 34.s,
            ),
          ),
          Gap(14.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.displayName,
                  style: TextStyle(
                    fontSize: 18.s,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    height: 1.25,
                  ),
                ),
                Gap(4.s),
                Row(
                  children: [
                    Icon(Icons.tag_rounded, size: 13.s, color: AppColors.textTertiary),
                    Gap(3.s),
                    Flexible(
                      child: Text(
                        device.deviceId,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.5.s, color: AppColors.textTertiary),
                      ),
                    ),
                  ],
                ),
                Gap(10.s),
                AppStatusBadge.machine(isOn: isOn),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.device, this.ownerName = ''});

  final DeviceEntity device;
  final String ownerName;

  @override
  Widget build(BuildContext context) {
    final percent = device.percentAppDeducted;
    final owner = ownerName.isNotEmpty ? ownerName : _orDash(device.userId);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Thông tin thiết bị'),
          Gap(4.s),
          AppInfoRow(
            label: 'Mã thiết bị',
            value: _orDash(device.deviceId),
            icon: Icons.tag_rounded,
          ),
          const _RowDivider(),
          AppInfoRow(
            label: 'Loại thiết bị',
            value: _orDash(device.deviceType),
            icon: Icons.category_outlined,
          ),
          const _RowDivider(),
          AppInfoRow(
            label: 'Loại máy',
            value: _orDash(device.machineType),
            icon: Icons.local_laundry_service_outlined,
          ),
          const _RowDivider(),
          AppInfoRow(
            label: 'Địa chỉ',
            value: _orDash(device.address),
            icon: Icons.location_on_outlined,
          ),
          const _RowDivider(),
          AppInfoRow(
            label: 'Phần trăm app trừ',
            value: percent == null ? '—' : '${_formatPercent(percent)}%',
            icon: Icons.percent_rounded,
          ),
          const _RowDivider(),
          AppInfoRow(
            label: 'Chủ sở hữu',
            value: owner,
            icon: Icons.person_outline_rounded,
          ),
        ],
      ),
    );
  }
}

class _ServicesSection extends StatelessWidget {
  const _ServicesSection({required this.services});

  final List<ServiceEntity> services;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Dịch vụ'),
          Gap(8.s),
          if (services.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.s),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded, size: 18.s, color: AppColors.textTertiary),
                  Gap(8.s),
                  Text(
                    'Chưa có dịch vụ nào',
                    style: TextStyle(fontSize: 13.5.s, color: AppColors.textTertiary),
                  ),
                ],
              ),
            )
          else
            for (int i = 0; i < services.length; i++) ...[
              if (i > 0) Gap(8.s),
              _ServiceRow(service: services[i]),
            ],
        ],
      ),
    );
  }
}

class _ServiceRow extends StatelessWidget {
  const _ServiceRow({required this.service});

  final ServiceEntity service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.s),
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        borderRadius: BorderRadius.circular(12.s),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.s),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(10.s),
            ),
            child: Icon(Icons.local_offer_outlined, size: 18.s, color: AppColors.primary),
          ),
          Gap(12.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.serviceName.isEmpty ? 'Dịch vụ' : service.serviceName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.5.s,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Gap(2.s),
                Row(
                  children: [
                    Icon(Icons.timer_outlined, size: 13.s, color: AppColors.textTertiary),
                    Gap(3.s),
                    Text(
                      '${service.totalMinutes} phút',
                      style: TextStyle(fontSize: 12.5.s, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(8.s),
          Text(
            CurrencyUtils.formatVnd(service.price),
            style: TextStyle(
              fontSize: 14.5.s,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Per-device history + report links (open the server pages in a WebView,
/// scoped to this machine via hostID + deviceID — same as the Android detail).
class _LinksCard extends StatelessWidget {
  const _LinksCard({required this.device});

  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(vertical: 4.s, horizontal: 4.s),
      child: Column(
        children: [
          _row(
            context,
            icon: Icons.history_rounded,
            color: AppColors.primary,
            bg: AppColors.primarySoft,
            label: 'Lịch sử giặt',
            subtitle: 'Lịch sử của máy này',
            onTap: () => _open(context, 'history', 'Lịch sử giặt'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.s),
            child: const _RowDivider(),
          ),
          _row(
            context,
            icon: Icons.bar_chart_rounded,
            color: AppColors.warning,
            bg: AppColors.warningSoft,
            label: 'Báo cáo / Thống kê',
            subtitle: 'Doanh thu của máy này',
            onTap: () => _open(context, 'report', 'Báo cáo/Thống kê'),
          ),
        ],
      ),
    );
  }

  void _open(BuildContext context, String path, String title) {
    final base = getIt<AppConfig>().baseUrl;
    final token = getIt<AuthLocalStore>().token;
    final url =
        '$base/$path?hostID=${device.userId}&deviceID=${device.deviceId}';
    context.router.push(ReportRoute(url: url, title: title, token: token));
  }

  Widget _row(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required Color bg,
    required String label,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.s),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.s, vertical: 12.s),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(9.s),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(10.s),
              ),
              child: Icon(icon, size: 20.s, color: color),
            ),
            Gap(12.s),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 15.s,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Gap(2.s),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12.5.s, color: AppColors.textTertiary),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, size: 22.s, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.s,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, thickness: 1, color: AppColors.divider);
  }
}

class _EditBar extends StatelessWidget {
  const _EditBar({required this.isSaving});

  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.s, 12.s, 16.s, 12.s),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16.s,
            offset: Offset(0, -4.s),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: AppButton(
          label: 'Chỉnh sửa',
          icon: Icons.edit_rounded,
          loading: isSaving,
          onPressed: () => _openEdit(context),
        ),
      ),
    );
  }

  Future<void> _openEdit(BuildContext context) async {
    final cubit = context.read<DeviceDetailCubit>();
    await AppBottomSheet.show<void>(
      context,
      title: 'Chỉnh sửa thiết bị',
      body: BlocProvider<DeviceDetailCubit>.value(
        value: cubit,
        child: const _EditDeviceForm(),
      ),
    );
  }
}

class _EditDeviceForm extends StatefulWidget {
  const _EditDeviceForm();

  @override
  State<_EditDeviceForm> createState() => _EditDeviceFormState();
}

class _EditDeviceFormState extends State<_EditDeviceForm> {
  late final TextEditingController _deviceTypeCtrl;
  late final TextEditingController _machineTypeCtrl;
  late final TextEditingController _addressCtrl;
  late final TextEditingController _percentCtrl;
  late final List<_ServiceControllers> _services;

  @override
  void initState() {
    super.initState();
    final device = context.read<DeviceDetailCubit>().state.device;
    _deviceTypeCtrl = TextEditingController(text: device.deviceType);
    _machineTypeCtrl = TextEditingController(text: device.machineType);
    _addressCtrl = TextEditingController(text: device.address);
    _percentCtrl = TextEditingController(
      text: device.percentAppDeducted == null
          ? ''
          : _formatPercent(device.percentAppDeducted!),
    );
    _services =
        device.services.map(_ServiceControllers.fromEntity).toList();
  }

  @override
  void dispose() {
    _deviceTypeCtrl.dispose();
    _machineTypeCtrl.dispose();
    _addressCtrl.dispose();
    _percentCtrl.dispose();
    for (final s in _services) {
      s.dispose();
    }
    super.dispose();
  }

  void _addService() {
    setState(() => _services.add(_ServiceControllers.empty()));
  }

  void _removeService(int index) {
    _services.removeAt(index).dispose();
    setState(() {});
  }

  void _save() {
    final cubit = context.read<DeviceDetailCubit>();
    final percent =
        double.tryParse(_percentCtrl.text.trim().replaceAll(',', '.')) ?? 0;
    cubit.saveChanges(
      deviceType: _deviceTypeCtrl.text.trim(),
      machineType: _machineTypeCtrl.text.trim(),
      address: _addressCtrl.text.trim(),
      percentAppDeducted: percent,
      services: _services.map((c) => c.toEntity()).toList(),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceDetailCubit, DeviceDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.s, 8.s, 20.s, 24.s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                label: 'Loại thiết bị',
                controller: _deviceTypeCtrl,
                hint: 'Nhập loại thiết bị',
                textInputAction: TextInputAction.next,
              ),
              Gap(14.s),
              AppTextField(
                label: 'Loại máy',
                controller: _machineTypeCtrl,
                hint: 'Nhập loại máy',
                textInputAction: TextInputAction.next,
              ),
              Gap(14.s),
              AppTextField(
                label: 'Địa chỉ',
                controller: _addressCtrl,
                hint: 'Nhập địa chỉ',
                maxLines: 2,
                textInputAction: TextInputAction.newline,
              ),
              Gap(14.s),
              AppTextField(
                label: 'Phần trăm app trừ (%)',
                controller: _percentCtrl,
                hint: 'Ví dụ: 10',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                ],
              ),
              Gap(20.s),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Dịch vụ',
                      style: TextStyle(
                        fontSize: 15.s,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  AppButton(
                    label: 'Thêm dịch vụ',
                    variant: AppButtonVariant.text,
                    fullWidth: false,
                    icon: Icons.add_rounded,
                    onPressed: _addService,
                  ),
                ],
              ),
              Gap(4.s),
              if (_services.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.s),
                  child: Text(
                    'Chưa có dịch vụ nào. Nhấn "Thêm dịch vụ" để thêm mới.',
                    style: TextStyle(fontSize: 13.s, color: AppColors.textTertiary),
                  ),
                )
              else
                for (int i = 0; i < _services.length; i++) ...[
                  if (i > 0) Gap(12.s),
                  _EditServiceCard(
                    controllers: _services[i],
                    index: i,
                    onRemove: () => _removeService(i),
                  ),
                ],
              Gap(24.s),
              AppButton(
                label: 'Lưu',
                icon: Icons.save_rounded,
                loading: state.isSaving,
                onPressed: _save,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EditServiceCard extends StatelessWidget {
  const _EditServiceCard({
    required this.controllers,
    required this.index,
    required this.onRemove,
  });

  final _ServiceControllers controllers;
  final int index;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.s),
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        borderRadius: BorderRadius.circular(14.s),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Dịch vụ ${index + 1}',
                  style: TextStyle(
                    fontSize: 13.5.s,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              AppIconButton(
                icon: Icons.delete_outline_rounded,
                onTap: onRemove,
                color: AppColors.error,
                backgroundColor: AppColors.errorSoft,
                tooltip: 'Xoá dịch vụ',
              ),
            ],
          ),
          Gap(10.s),
          AppTextField(
            label: 'Tên dịch vụ',
            controller: controllers.name,
            hint: 'Nhập tên dịch vụ',
            textInputAction: TextInputAction.next,
          ),
          Gap(10.s),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppTextField(
                  label: 'Giá (đ)',
                  controller: controllers.price,
                  hint: '0',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Gap(12.s),
              Expanded(
                child: AppTextField(
                  label: 'Số phút',
                  controller: controllers.minutes,
                  hint: '0',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceControllers {
  _ServiceControllers({
    required this.id,
    required this.name,
    required this.price,
    required this.minutes,
  });

  factory _ServiceControllers.fromEntity(ServiceEntity s) => _ServiceControllers(
    id: s.id,
    name: TextEditingController(text: s.serviceName),
    price: TextEditingController(text: s.price == 0 ? '' : s.price.toString()),
    minutes: TextEditingController(
      text: s.totalMinutes == 0 ? '' : s.totalMinutes.toString(),
    ),
  );

  factory _ServiceControllers.empty() => _ServiceControllers(
    id: '',
    name: TextEditingController(),
    price: TextEditingController(),
    minutes: TextEditingController(),
  );

  final String id;
  final TextEditingController name;
  final TextEditingController price;
  final TextEditingController minutes;

  ServiceEntity toEntity() => ServiceEntity(
    id: id,
    serviceName: name.text.trim(),
    price: CurrencyUtils.parseAmount(price.text),
    totalMinutes: int.tryParse(minutes.text.trim()) ?? 0,
  );

  void dispose() {
    name.dispose();
    price.dispose();
    minutes.dispose();
  }
}

String _orDash(String value) => value.trim().isEmpty ? '—' : value;

String _formatPercent(double value) {
  if (value == value.roundToDouble()) return value.toInt().toString();
  return value.toString();
}
