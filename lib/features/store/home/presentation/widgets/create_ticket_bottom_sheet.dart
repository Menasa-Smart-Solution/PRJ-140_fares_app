part of '../../features_imports.dart';

class CreateTicketBottomSheet extends StatefulWidget {
  const CreateTicketBottomSheet({super.key});

  @override
  State<CreateTicketBottomSheet> createState() =>
      _CreateTicketBottomSheetState();
}

class _CreateTicketBottomSheetState extends State<CreateTicketBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _parcelIdController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _parcelIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitTicket() {
    if (_formKey.currentState!.validate()) {
      context.pop();
      context.read<TicketsCubit>().createTicket(
        CreateTicketRequestModel(
          parcelId: int.parse(_parcelIdController.text),
          desc: _descriptionController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                LocaleKeys.createNewTicket.tr(),
                style: AppTextStyles.bold16.copyWith(),
                textAlign: TextAlign.center,
              ),
              verticalSpace(24),
              AppTextFormField(
                controller: _parcelIdController,
                hintText: LocaleKeys.parcelId.tr(),
                showLabel: true,
                title: LocaleKeys.parcelIdHint.tr(),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                  return null;
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                radius: 20,
                keyboardType: TextInputType.number,
              ),
              verticalSpace(16),
              AppTextFormField(
                controller: _descriptionController,
                showLabel: true,
                title: LocaleKeys.desc.tr(),
                hintText: LocaleKeys.descHint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                  return null;
                },
                radius: 20,

                maxLines: 2,
                keyboardType: TextInputType.multiline,
              ),
              verticalSpace(24),
              AppTextButton(
                onPressed: _submitTicket,
                text: LocaleKeys.createNewTicket.tr(),
              ),
              verticalSpace(8),
            ],
          ),
        ),
      ),
    );
  }
}
