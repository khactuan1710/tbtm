import 'package:auto_route/auto_route.dart';
import 'package:quanlymaygiat/app_router.dart';
import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';
import 'package:quanlymaygiat/features/users/presentation/cubit/user_manage_cubit.dart';
import 'package:quanlymaygiat/features/users/presentation/widgets/user_card.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

@RoutePage()
class UserManageScreen extends BasePage<UserManageCubit, UserManageState> {
  const UserManageScreen({super.key});

  @override
  List<BlocProvider> get providers => [
    BlocProvider<UserManageCubit>(
      create: (_) => getIt<UserManageCubit>()..loadUsers(),
    ),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return AppScaffold(
      appBar: BaseAppBar(
        title: 'Quản lý người dùng',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.s),
            child: Builder(
              builder: (context) => AppIconButton(
                icon: Icons.person_add_alt_1_rounded,
                tooltip: 'Thêm tài khoản',
                onTap: () => _createAccount(context),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<UserManageCubit, UserManageState>(
        builder: (context, state) {
          final cubit = context.read<UserManageCubit>();
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.s, 12.s, 16.s, 8.s),
                child: AppSearchField(
                  hint: 'Tìm theo tên, tài khoản, SĐT...',
                  onChanged: cubit.search,
                ),
              ),
              Expanded(child: _buildList(context, state, cubit)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    UserManageState state,
    UserManageCubit cubit,
  ) {
    if (state.isLoading && state.allUsers.isEmpty) {
      return const Center(child: AppLoading());
    }
    if (state.hasError && state.allUsers.isEmpty) {
      return AppErrorView(onRetry: cubit.loadUsers);
    }

    return AppRefresh(
      onRefresh: () => cubit.loadUsers(showLoadingUi: false),
      child: state.users.isEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Gap(MediaQuery.sizeOf(context).height * 0.22),
                const AppEmpty(
                  message: 'Không tìm thấy người dùng nào',
                  icon: Icons.group_off_rounded,
                ),
              ],
            )
          : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(16.s, 4.s, 16.s, 24.s),
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return UserCard(
                  user: user,
                  onTap: () => _openDetail(context, user),
                  onToggleActive: (value) => cubit.toggleActive(user, value),
                );
              },
            ),
    );
  }

  Future<void> _createAccount(BuildContext context) async {
    final cubit = context.read<UserManageCubit>();
    await context.router.push(const CreateAccountRoute());
    cubit.loadUsers(showLoadingUi: false);
  }

  Future<void> _openDetail(BuildContext context, UserEntity user) async {
    final cubit = context.read<UserManageCubit>();
    await context.router.push(UserDetailRoute(user: user));
    cubit.loadUsers(showLoadingUi: false);
  }
}
