import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:quanlymaygiat/app_router.dart';
import 'package:quanlymaygiat/core/config/app_config.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/device_entity.dart';
import 'package:quanlymaygiat/features/devices/presentation/cubit/home_cubit.dart';
import 'package:quanlymaygiat/features/devices/presentation/widgets/device_card.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class HomeScreen extends BasePage<HomeCubit, HomeState> {
  const HomeScreen({super.key});

  @override
  List<BlocProvider> get providers => [
    BlocProvider<HomeCubit>(create: (_) => getIt<HomeCubit>()..init()),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          // No top SafeArea: the gradient header runs edge-to-edge behind the
          // status bar / dynamic island; the header itself pads its content
          // below the top inset. AnnotatedRegion keeps the status bar icons
          // light (visible) over the dark header.
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: AppRefresh(
              onRefresh: () => cubit.loadDevices(showLoadingUi: false),
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: _Header(state: state)),
                  SliverToBoxAdapter(child: _StatsRow(state: state)),
                  SliverToBoxAdapter(child: _ActionGrid(state: state)),
                  SliverToBoxAdapter(child: _Controls(state: state)),
                  _DeviceSliverList(state: state),
                  SliverToBoxAdapter(child: Gap(24.s)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final name = state.user?.fullName ?? '';
    final topInset = MediaQuery.paddingOf(context).top;
    return Container(
      padding: EdgeInsets.fromLTRB(20.s, topInset + 14.s, 12.s, 20.s),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.authGradientTop, AppColors.authGradientBottom],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xin chào 👋',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13.s),
                ),
                Gap(2.s),
                Text(
                  name.isEmpty ? 'Người dùng' : name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 20.s, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          _circleAction(Icons.support_agent_rounded, () => _callHotline(context)),
          Gap(8.s),
          _circleAction(Icons.logout_rounded, () => _confirmLogout(context)),
        ],
      ),
    );
  }

  Widget _circleAction(IconData icon, VoidCallback onTap) => Material(
    color: Colors.white.withValues(alpha: 0.18),
    shape: const CircleBorder(),
    child: InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(9.s),
        child: Icon(icon, color: Colors.white, size: 22.s),
      ),
    ),
  );

  Future<void> _callHotline(BuildContext context) async {
    final uri = Uri(scheme: 'tel', path: '0983322285');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      AppSnackBar.showError(context, 'Không tìm thấy ứng dụng gọi điện');
    }
  }

  Future<void> _confirmLogout(BuildContext context) async {
    final cubit = context.read<HomeCubit>();
    final ok = await AppConfirmDialog.show(
      context,
      title: 'Đăng xuất',
      message: 'Bạn có chắc chắn muốn đăng xuất không?',
      confirmText: 'Đăng xuất',
      icon: Icons.logout_rounded,
      isDestructive: true,
    );
    if (!ok) return;
    await cubit.logout();
    if (context.mounted) context.router.replaceAll([const LoginRoute()]);
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.s, 16.s, 20.s, 4.s),
      child: Row(
        children: [
          Expanded(
            child: _statCard(
              icon: Icons.devices_other_rounded,
              label: 'Tổng thiết bị',
              value: '${state.totalCount}',
              color: AppColors.primary,
              bg: AppColors.primarySoft,
            ),
          ),
          Gap(12.s),
          Expanded(
            child: _statCard(
              icon: Icons.bolt_rounded,
              label: 'Đang chạy',
              value: '${state.runningCount}',
              color: AppColors.statusRunning,
              bg: AppColors.successSoft,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required Color bg,
  }) => AppCard(
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.s),
          decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12.s)),
          child: Icon(icon, color: color, size: 22.s),
        ),
        Gap(12.s),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: TextStyle(fontSize: 22.s, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
              Text(label, style: TextStyle(fontSize: 12.s, color: AppColors.textSecondary)),
            ],
          ),
        ),
      ],
    ),
  );
}

class _ActionGrid extends StatelessWidget {
  const _ActionGrid({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final user = state.user;
    final isAdmin = user?.isAdmin ?? false;
    final actions = <_ActionItem>[
      if (isAdmin)
        _ActionItem(Icons.group_rounded, 'Người dùng', AppColors.info, () {
          context.router.push(const UserManageRoute());
        }),
      if (isAdmin)
        _ActionItem(Icons.add_box_rounded, 'Thêm máy', AppColors.secondary, () {
          context.router.push(const CreateDeviceRoute());
        }),
      _ActionItem(Icons.bar_chart_rounded, 'Báo cáo', AppColors.warning, () {
        _openReport(context, isAdmin ? 'admin/report' : 'report', 'Báo cáo/thống kê');
      }),
      _ActionItem(Icons.history_rounded, 'Lịch sử', AppColors.primary, () {
        _openReport(context, 'history', 'Lịch sử giặt');
      }),
      _ActionItem(Icons.lock_reset_rounded, 'Đổi mật khẩu', AppColors.statusIdle, () {
        context.router.push(const ChangePasswordRoute());
      }),
      _ActionItem(Icons.link_rounded, 'Tích hợp SePay', AppColors.success, () {
        context.router.push(const SepayIntegrationRoute());
      }),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(20.s, 12.s, 20.s, 4.s),
      child: Wrap(
        spacing: 12.s,
        runSpacing: 12.s,
        children: [
          for (final a in actions)
            SizedBox(
              width: (MediaQuery.sizeOf(context).width - 40.s - 24.s) / 4,
              child: _actionButton(a),
            ),
        ],
      ),
    );
  }

  Widget _actionButton(_ActionItem a) => InkWell(
    borderRadius: BorderRadius.circular(16.s),
    onTap: a.onTap,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(14.s),
          decoration: BoxDecoration(
            color: a.color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(16.s),
          ),
          child: Icon(a.icon, color: a.color, size: 24.s),
        ),
        Gap(6.s),
        Text(
          a.label,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(fontSize: 11.5.s, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );

  void _openReport(BuildContext context, String path, String title) {
    final user = context.read<HomeCubit>().user;
    final base = getIt<AppConfig>().baseUrl;
    final hostId = user?.userId ?? '';
    final url = path == 'history'
        ? '$base/history'
        : '$base/$path?hostID=$hostId';
    context.router.push(
      ReportRoute(url: url, title: title, token: user?.token ?? ''),
    );
  }
}

class _ActionItem {
  _ActionItem(this.icon, this.label, this.color, this.onTap);
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
}

class _Controls extends StatelessWidget {
  const _Controls({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Padding(
      padding: EdgeInsets.fromLTRB(20.s, 16.s, 20.s, 8.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: AppSearchField(hint: 'Tìm thiết bị...', onChanged: cubit.search)),
              Gap(10.s),
              _MinutesField(minutes: state.defaultMinutes, onChanged: cubit.setDefaultMinutes),
            ],
          ),
          Gap(16.s),
          Text(
            'Danh sách thiết bị',
            style: TextStyle(fontSize: 16.s, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
          ),
          Gap(8.s),
        ],
      ),
    );
  }
}

class _MinutesField extends StatefulWidget {
  const _MinutesField({required this.minutes, required this.onChanged});
  final int minutes;
  final ValueChanged<int> onChanged;

  @override
  State<_MinutesField> createState() => _MinutesFieldState();
}

class _MinutesFieldState extends State<_MinutesField> {
  late final TextEditingController _controller =
      TextEditingController(text: '${widget.minutes}');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116.s,
      height: 52.s,
      padding: EdgeInsets.symmetric(horizontal: 12.s),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14.s),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Row(
        children: [
          Icon(Icons.timer_outlined, size: 18.s, color: AppColors.textTertiary),
          Gap(6.s),
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.s, fontWeight: FontWeight.w700),
              decoration: const InputDecoration(
                isDense: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: '30',
              ),
              onChanged: (v) {
                final m = int.tryParse(v);
                if (m != null) widget.onChanged(m);
              },
            ),
          ),
          Text('phút', style: TextStyle(fontSize: 12.s, color: AppColors.textTertiary)),
        ],
      ),
    );
  }
}

class _DeviceSliverList extends StatelessWidget {
  const _DeviceSliverList({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    if (state.isLoading && state.allDevices.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: AppLoading()),
      );
    }
    if (state.hasError && state.allDevices.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: AppErrorView(onRetry: cubit.loadDevices),
      );
    }
    if (state.devices.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: AppEmpty(message: 'Chưa có thiết bị nào', icon: Icons.local_laundry_service_rounded),
      );
    }

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.s),
      sliver: SliverList.builder(
        itemCount: state.devices.length,
        itemBuilder: (context, index) {
          final device = state.devices[index];
          return DeviceCard(
            device: device,
            isToggling: state.togglingDeviceId == device.deviceId,
            onToggle: (v) => cubit.toggleDevice(device, v),
            onTap: () => _openDetail(context, device),
          );
        },
      ),
    );
  }

  Future<void> _openDetail(BuildContext context, DeviceEntity device) async {
    final cubit = context.read<HomeCubit>();
    await context.router.push(DeviceDetailRoute(device: device));
    cubit.loadDevices(showLoadingUi: false);
  }
}
