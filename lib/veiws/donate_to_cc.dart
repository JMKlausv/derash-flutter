import 'package:derash/widgets/donate_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DonateToCc extends StatelessWidget {
  const DonateToCc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate To Cardiac Center'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Donate through SMS',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return const DonateDialogue(amount: 1);
                        });
                  },
                  leading: Image.asset(
                    'assets/images/CCE.png',
                    width: 50,
                  ),
                  title: const Text(
                    'Donate 1 Birr',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click to donate',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return const DonateDialogue(amount: 10);
                        });
                  },
                  leading: Image.asset(
                    'assets/images/CCE.png',
                    width: 50,
                  ),
                  title: const Text(
                    'Donate 10 Birr',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click to donate',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return const DonateDialogue(amount: 50);
                        });
                  },
                  leading: Image.asset(
                    'assets/images/CCE.png',
                    width: 50,
                  ),
                  title: const Text(
                    'Donate 50 Birr',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click to donate',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return const DonateDialogue(amount: 100);
                        });
                  },
                  leading: Image.asset(
                    'assets/images/CCE.png',
                    width: 50,
                  ),
                  title: const Text(
                    'Donate 100 Birr',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click to donate',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Donate through Bank',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    final Map<String, String> bankAccounts = {
                      'cbe': '100000183906',
                      'dashen': '0041600483011',
                      'awash': '01308236167000',
                      'abay': '1021817336052015',
                      'coop': '1022200034519',
                      'abysinya': '602}63547',
                    };

                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return SimpleDialog(
                              titlePadding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15, bottom: 0),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              title: const Text(
                                'Donate through Bank',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Here are the bank accounts you can donate to ',
                                          style: TextStyle(
                                            fontSize: 21,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['cbe'].toString()),
                                        BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['dashen']
                                                    .toString()),
                                        BankAccountInfo(
                                            accountNumber: bankAccounts['awash']
                                                .toString()),
                                        BankAccountInfo(
                                            accountNumber: bankAccounts['abay']
                                                .toString()),
                                        BankAccountInfo(
                                            accountNumber: bankAccounts['coop']
                                                .toString()),
                                        BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['abysinya']
                                                    .toString())
                                      ],
                                    ),
                                  ),
                                )
                              ]);
                        });
                  },
                  leading: Image.asset(
                    'assets/images/CCE.png',
                    width: 50,
                  ),
                  title: const Text(
                    'Get Bank Information',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click here to get bank account information',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return SimpleDialog(
                              titlePadding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15, bottom: 0),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              title: const Text(
                                'Donate through Bank',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              children: [
                                const Text(
                                  'Here are the bank accounts you can donate to ',
                                  style: TextStyle(
                                    fontSize: 21,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  elevation: 1,
                                  child: ListTile(
                                    onTap: () {},
                                    title: Column(children: const [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '02311236167000',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Churchill Branch',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        'Swift code = AWINETAA',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ]),
                                    leading: Image.asset(
                                      'assets/images/linkedin.png',
                                      width: 35,
                                    ),
                                  ),
                                )
                              ]);
                        });
                  },
                  leading: Image.asset(
                    'assets/images/CCE.png',
                    width: 50,
                  ),
                  title: const Text(
                    'Get Forein Currency Account',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click here to get bank account information',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class BankAccountInfo extends StatelessWidget {
  final String accountNumber;
  const BankAccountInfo({Key? key, required this.accountNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        onTap: () {
          Clipboard.setData(ClipboardData(text: accountNumber)).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'Copied to clipboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )));
          });
        },
        title: Text(
          accountNumber,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: const Text(
          'Click to copy account number',
          style: TextStyle(color: Colors.black),
        ),
        leading: Image.asset(
          'assets/images/linkedin.png',
          width: 35,
        ),
      ),
    );
  }
}
