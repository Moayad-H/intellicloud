import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class RedactedScreen extends StatelessWidget {
  const RedactedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                ).redacted(
                  context: context,
                  redact: true,
                ),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.height * 0.6,
                height: MediaQuery.of(context).size.height * 0.325,
              ).redacted(context: context, redact: true),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.325,
                ).redacted(context: context, redact: true),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.height * 0.5,
                height: MediaQuery.of(context).size.height * 0.325,
              ).redacted(context: context, redact: true),
              Container(
                height: MediaQuery.of(context).size.height * 0.325,
                width: MediaQuery.of(context).size.height * 0.5,
              ).redacted(context: context, redact: true),
              Container(
                height: MediaQuery.of(context).size.height * 0.325,
                width: MediaQuery.of(context).size.height * 0.25,
              ).redacted(context: context, redact: true)
            ],
          ),
        ],
      ),
    );
  }
}
