import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

/// A user list item: avatar, name, username, phone, type + active badges and a
/// quick lock/unlock switch.
class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.onTap,
    required this.onToggleActive,
  });

  final UserEntity user;
  final VoidCallback onTap;
  final ValueChanged<bool> onToggleActive;

  @override
  Widget build(BuildContext context) {
    final isAdmin = user.isAdmin;
    final isActive = user.isActive;
    final letter = user.fullName.trim().isNotEmpty
        ? user.fullName.trim().substring(0, 1).toUpperCase()
        : '?';

    return AppCard(
      onTap: onTap,
      margin: EdgeInsets.only(bottom: 12.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.s,
            height: 50.s,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isAdmin ? AppColors.infoSoft : AppColors.primarySoft,
              shape: BoxShape.circle,
            ),
            child: Text(
              letter,
              style: TextStyle(
                fontSize: 20.s,
                fontWeight: FontWeight.w800,
                color: isAdmin ? AppColors.info : AppColors.primary,
              ),
            ),
          ),
          Gap(14.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName.isEmpty ? 'Chưa đặt tên' : user.fullName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.5.s,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Gap(3.s),
                Row(
                  children: [
                    Icon(Icons.alternate_email_rounded,
                        size: 13.s, color: AppColors.textTertiary),
                    Gap(3.s),
                    Flexible(
                      child: Text(
                        user.username,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12.5.s, color: AppColors.textTertiary),
                      ),
                    ),
                  ],
                ),
                Gap(3.s),
                Row(
                  children: [
                    Icon(Icons.phone_outlined,
                        size: 13.s, color: AppColors.textTertiary),
                    Gap(4.s),
                    Flexible(
                      child: Text(
                        user.phoneNumber.isEmpty
                            ? 'Chưa có SĐT'
                            : user.phoneNumber,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12.5.s, color: AppColors.textSecondary),
                      ),
                    ),
                  ],
                ),
                Gap(9.s),
                Wrap(
                  spacing: 8.s,
                  runSpacing: 6.s,
                  children: [
                    AppStatusBadge(
                      label: isAdmin ? 'Quản trị' : 'Người dùng',
                      color: isAdmin ? AppColors.info : AppColors.statusIdle,
                      background:
                          isAdmin ? AppColors.infoSoft : AppColors.disabledBg,
                      icon: isAdmin
                          ? Icons.shield_rounded
                          : Icons.person_rounded,
                    ),
                    AppStatusBadge(
                      label: isActive ? 'Đang hoạt động' : 'Đã khoá',
                      color: isActive ? AppColors.success : AppColors.error,
                      background:
                          isActive ? AppColors.successSoft : AppColors.errorSoft,
                      icon: isActive
                          ? Icons.check_circle_rounded
                          : Icons.lock_rounded,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(8.s),
          Switch.adaptive(
            value: isActive,
            activeThumbColor: AppColors.success,
            onChanged: onToggleActive,
          ),
        ],
      ),
    );
  }
}
