import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TTransferContainer extends StatelessWidget {
  const TTransferContainer({
    super.key,
    required this.flgInOrOut,
    required this.nTransfers,
  });

  final bool flgInOrOut;
  final int nTransfers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: flgInOrOut
              ? TTexts.transfersIn.toUpperCase()
              : TTexts.transfersOut.toUpperCase(),
          textColor:
              flgInOrOut ? const Color(0xFF50E250) : const Color(0xFFFF5454),
        ),
        nTransfers > 0
            ? Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: FlexColumnWidth(6),
                  1: FlexColumnWidth(3),
                  2: FlexColumnWidth(2),
                },
                children: [
                      TableRow(
                        children: [
                          buildTableCellText(context, TTexts.name, true),
                          flgInOrOut
                              ? buildTableCellText(context, TTexts.from, true)
                              : buildTableCellText(context, TTexts.to, true),
                          buildTableCellText(context, TTexts.fee, true),
                        ],
                      )
                    ] +
                    List.generate(
                      nTransfers,
                      (index) => TableRow(
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? TColors.darkerGrey.withOpacity(0.3)
                              : TColors.darkerGrey.withOpacity(0.1),
                        ),
                        children: [
                          buildTableCellText(
                            context,
                            'Name Surname ${index + 1}',
                            false,
                          ),
                          buildTableCellText(
                            context,
                            'Team ${index + 1}',
                            false,
                          ),
                          buildTableCellText(
                            context,
                            '€1${index}M',
                            false,
                          ),
                        ],
                      ),
                    ),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: TSizes.spaceBtwSections,
                ),
                child: Text(TTexts.noTransfers),
              ),
        SizedBox(height: nTransfers > 0 ? TSizes.spaceBtwItems : 0),
        Row(
          children: [
            Text(
              TTexts.total,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text(
              flgInOrOut ? '€38M' : '€0',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }

  Padding buildTableCellText(BuildContext context, String text, bool header) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.xs,
        horizontal: TSizes.sm,
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: header
            ? Theme.of(context).textTheme.bodyMedium
            : Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
