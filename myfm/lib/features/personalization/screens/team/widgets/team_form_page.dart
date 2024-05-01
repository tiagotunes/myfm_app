import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TeamFormPage extends StatelessWidget {
  const TeamFormPage({
    super.key,
    required this.formFields,
    this.bottomLabel,
  });

  final Widget formFields;
  final String? bottomLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        TSizes.defaultSpace / 2,
        TSizes.defaultSpace * 2,
        TSizes.defaultSpace / 2,
        TSizes.defaultSpace * 3,
      ),
      child: TRoundedContainer(
        width: double.infinity,
        backgroundColor: TColors.dark,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              formFields,
              bottomLabel != null
                  ? Text(
                      bottomLabel!,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
