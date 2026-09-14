import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

/// Opens a searchable bottom sheet listing [owners]. Pops with the selected
/// [UserEntity], or `null` if the sheet is dismissed.
Future<UserEntity?> showOwnerPicker(
  BuildContext context,
  List<UserEntity> owners,
) {
  return AppBottomSheet.show<UserEntity>(
    context,
    title: 'Chọn chủ sở hữu',
    body: _OwnerPickerBody(owners: owners),
  );
}

class _OwnerPickerBody extends StatefulWidget {
  const _OwnerPickerBody({required this.owners});

  final List<UserEntity> owners;

  @override
  State<_OwnerPickerBody> createState() => _OwnerPickerBodyState();
}

class _OwnerPickerBodyState extends State<_OwnerPickerBody> {
  String _query = '';

  List<UserEntity> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return widget.owners;
    return widget.owners
        .where(
          (u) =>
              u.fullName.toLowerCase().contains(q) ||
              u.username.toLowerCase().contains(q),
        )
        .toList(growable: false);
  }

  String _initial(UserEntity user) {
    final source = user.fullName.isNotEmpty ? user.fullName : user.username;
    return source.isEmpty ? '?' : source.substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.s, 8.s, 20.s, 12.s),
          child: AppSearchField(
            hint: 'Tìm chủ sở hữu...',
            onChanged: (v) => setState(() => _query = v),
          ),
        ),
        Flexible(
          child: items.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.s),
                  child: const AppEmpty(message: 'Không tìm thấy người dùng'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(12.s, 0, 12.s, 16.s),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => Gap(4.s),
                  itemBuilder: (context, index) {
                    final user = items[index];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.s),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primarySoft,
                        child: Text(
                          _initial(user),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.s,
                          ),
                        ),
                      ),
                      title: Text(
                        user.fullName.isEmpty ? user.username : user.fullName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.s,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      subtitle: Text(
                        '@${user.username}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.s,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      onTap: () => Navigator.of(context).pop(user),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
