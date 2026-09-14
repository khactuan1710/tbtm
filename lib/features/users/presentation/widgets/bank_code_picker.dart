import 'package:quanlymaygiat/features/users/domain/entities/bank_code_entity.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

/// Opens a searchable bottom sheet listing [banks] and resolves with the bank
/// the user taps, or `null` if dismissed.
Future<BankCodeEntity?> showBankCodePicker(
  BuildContext context,
  List<BankCodeEntity> banks,
) {
  return AppBottomSheet.show<BankCodeEntity>(
    context,
    title: 'Chọn ngân hàng',
    body: _BankCodePickerBody(banks: banks),
  );
}

class _BankCodePickerBody extends StatefulWidget {
  const _BankCodePickerBody({required this.banks});

  final List<BankCodeEntity> banks;

  @override
  State<_BankCodePickerBody> createState() => _BankCodePickerBodyState();
}

class _BankCodePickerBodyState extends State<_BankCodePickerBody> {
  final _searchController = TextEditingController();
  late List<BankCodeEntity> _filtered = widget.banks;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        _filtered = widget.banks;
      } else {
        _filtered = widget.banks
            .where(
              (b) =>
                  b.displayName.toLowerCase().contains(q) ||
                  b.name.toLowerCase().contains(q) ||
                  b.shortName.toLowerCase().contains(q) ||
                  b.code.toLowerCase().contains(q),
            )
            .toList(growable: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.s, 8.s, 20.s, 12.s),
          child: AppSearchField(
            controller: _searchController,
            hint: 'Tìm ngân hàng...',
            onChanged: _onSearch,
          ),
        ),
        if (_filtered.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.s),
            child: const AppEmpty(message: 'Không tìm thấy ngân hàng'),
          )
        else
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 12.s),
              itemCount: _filtered.length,
              separatorBuilder: (_, _) =>
                  const Divider(height: 1, color: AppColors.divider),
              itemBuilder: (context, index) {
                final bank = _filtered[index];
                return ListTile(
                  onTap: () => Navigator.of(context).pop(bank),
                  title: Text(
                    bank.displayName,
                    style: TextStyle(
                      fontSize: 15.s,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    bank.code,
                    style: TextStyle(
                      fontSize: 13.s,
                      color: AppColors.textSecondary,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
