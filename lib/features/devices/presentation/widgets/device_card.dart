import 'package:quanlymaygiat/features/devices/domain/entities/device_entity.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

/// A machine list item: name, id, status badge, quick on/off switch.
class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.device,
    required this.onToggle,
    required this.onTap,
    this.isToggling = false,
  });

  final DeviceEntity device;
  final ValueChanged<bool> onToggle;
  final VoidCallback onTap;
  final bool isToggling;

  @override
  Widget build(BuildContext context) {
    final isOn = device.isOn;
    return AppCard(
      onTap: onTap,
      margin: EdgeInsets.only(bottom: 12.s),
      child: Row(
        children: [
          Container(
            width: 52.s,
            height: 52.s,
            decoration: BoxDecoration(
              color: isOn ? AppColors.successSoft : AppColors.primarySoft,
              borderRadius: BorderRadius.circular(14.s),
            ),
            child: Icon(
              Icons.local_laundry_service_rounded,
              color: isOn ? AppColors.statusRunning : AppColors.primary,
              size: 28.s,
            ),
          ),
          Gap(14.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.5.s,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
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
                Gap(8.s),
                AppStatusBadge.machine(isOn: isOn),
              ],
            ),
          ),
          Gap(8.s),
          if (isToggling)
            SizedBox(
              width: 40.s,
              height: 24.s,
              child: Center(
                child: SizedBox(
                  width: 18.s,
                  height: 18.s,
                  child: const CircularProgressIndicator(strokeWidth: 2.4),
                ),
              ),
            )
          else
            Switch.adaptive(
              value: isOn,
              activeThumbColor: AppColors.statusRunning,
              onChanged: onToggle,
            ),
        ],
      ),
    );
  }
}
