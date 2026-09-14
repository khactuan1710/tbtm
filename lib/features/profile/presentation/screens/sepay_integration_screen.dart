import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:quanlymaygiat/features/profile/presentation/cubit/sepay_integration_cubit.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

@RoutePage()
class SepayIntegrationScreen
    extends BasePage<SepayIntegrationCubit, SepayIntegrationState> {
  const SepayIntegrationScreen({super.key});

  @override
  List<BlocProvider> get providers => [
    BlocProvider<SepayIntegrationCubit>(
      create: (_) => getIt<SepayIntegrationCubit>()..load(),
    ),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return AppScaffold(
      appBar: const BaseAppBar(title: 'Tích hợp SePay'),
      body: BlocBuilder<SepayIntegrationCubit, SepayIntegrationState>(
        builder: (context, state) {
          if (state.isLoading && state.config == null) {
            return const Center(child: AppLoading());
          }
          final config = state.config;
          if (config == null) {
            return AppErrorView(
              message: 'Không tải được thông tin',
              onRetry: () => context.read<SepayIntegrationCubit>().load(),
            );
          }
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Điền đúng thông tin dưới đây khi cấu hình Webhook bên '
                  'SePay (Tích hợp WebHooks → Thêm Webhook) để hệ thống tự '
                  'kích hoạt máy khi khách thanh toán, không cần app nghe SMS nữa.',
                  style: TextStyle(fontSize: 13.s, color: AppColors.textSecondary),
                ),
                Gap(16.s),
                _CopyField(
                  label: 'URL nhận webhook',
                  value: config.webhookUrl ?? '',
                ),
                Gap(12.s),
                _CopyField(label: 'Host ID', value: config.hostId ?? ''),
                Gap(16.s),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.vpn_key_rounded,
                            size: 18.s,
                            color: AppColors.primary,
                          ),
                          Gap(8.s),
                          Text(
                            'API Key',
                            style: TextStyle(
                              fontSize: 15.s,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      Gap(8.s),
                      if (state.newSecret != null) ...[
                        Text(
                          'Sao chép ngay — sẽ KHÔNG hiện lại nguyên văn sau khi rời màn hình này.',
                          style: TextStyle(fontSize: 12.5.s, color: AppColors.warning, fontWeight: FontWeight.w600),
                        ),
                        Gap(10.s),
                        _CopyField(label: '', value: state.newSecret!),
                        Gap(12.s),
                      ] else ...[
                        Text(
                          config.hasSepaySecret == true
                              ? 'Đã có API Key được cấu hình. Tạo mới sẽ THAY THẾ key cũ — nhớ cập nhật lại bên SePay.'
                              : 'Chưa có API Key nào — bấm nút bên dưới để tạo mới.',
                          style: TextStyle(fontSize: 12.5.s, color: AppColors.textTertiary),
                        ),
                        Gap(12.s),
                      ],
                      AppButton(
                        label: config.hasSepaySecret == true
                            ? 'Tạo API Key mới (thay thế key cũ)'
                            : 'Tạo API Key',
                        icon: Icons.autorenew_rounded,
                        variant: config.hasSepaySecret == true
                            ? AppButtonVariant.outlined
                            : AppButtonVariant.filled,
                        loading: state.isGenerating,
                        onPressed: () =>
                            context.read<SepayIntegrationCubit>().generateSecret(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CopyField extends StatelessWidget {
  const _CopyField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: TextStyle(
              fontSize: 12.5.s,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          Gap(6.s),
        ],
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.s, vertical: 10.s),
                decoration: BoxDecoration(
                  color: AppColors.scaffold,
                  borderRadius: BorderRadius.circular(10.s),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  value,
                  style: TextStyle(fontSize: 12.5.s, color: AppColors.textPrimary),
                ),
              ),
            ),
            Gap(8.s),
            AppIconButton(
              icon: Icons.copy_rounded,
              tooltip: 'Sao chép',
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: value));
                if (context.mounted) {
                  AppSnackBar.showSuccess(context, 'Đã sao chép');
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
