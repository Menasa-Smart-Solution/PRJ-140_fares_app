part of '../../../feature_imports.dart';

class ConversationsViewBody extends StatefulWidget {
  const ConversationsViewBody({super.key});

  @override
  State<ConversationsViewBody> createState() => _ConversationsViewBodyState();
}

class _ConversationsViewBodyState extends State<ConversationsViewBody> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _onSearchChanged(String? value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      context.read<ChatCubit>().filterConversationsByParcelId(
        value == null || value.isEmpty ? null : value,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ChatCubit>().getConversations();
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            surfaceTintColor: Colors.transparent,
            title: AppTextFormField(
              hintText: LocaleKeys.searchHint.tr(),
              validator: (value) {},
              onChanged: (value) {
                _onSearchChanged(value);
              },
              controller: _searchController,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  AppImages.imagesSearchPng,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),

          ConversationsBlocBuilder(scrollController: _scrollController),
        ],
      ),
    );
  }
}
