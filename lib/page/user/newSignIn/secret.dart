import 'package:flutter/material.dart';

class PrivacyAgreement extends StatefulWidget {
  PrivacyAgreement({Key key}) : super(key: key);

  @override
  _PrivacyAgreementState createState() => _PrivacyAgreementState();
}

class _PrivacyAgreementState extends State<PrivacyAgreement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Container(
          child: Text(
            "隐私政策和用户协议",
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "取消",
              style: TextStyle(fontSize: 20, color: Colors.orange[300]),
            ),
          ),
        ),
        // actions: <Widget>[
        //   Container(
        //     margin: EdgeInsets.only(right: 10),
        //     child: Icon(
        //       Icons.more_vert,
        //       size: 22,
        //       color: Colors.orange[300],
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text("本协议为您与「星辰缘 APP」(下称本 APP)版权所有者之间所订立的契约，具有合同的法律效力，请您仔细阅读。" +
              "\n\n" +
              "一、本协议内容、生效、变更。本协议内容包括协议正文及所有本 APP 已经发布的或将来可能发布的各类规则。所有规则为本协议不可分割的组成部分，与协议正文具有同等法律效力。如您对协议有任何疑问，应向本 APP 咨询。只要您使用本 APP 平台服务，则本协议即对您产生约束，届时您不应以未阅读本协议的内容或者未获得本 APP对您问询的解答等理由，主张本协议无效，或要求撤销本协议。您确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。您承诺接受并遵守本协议的约定。如果您不同意本协议的约定，您应立即停止注册程序或停止使用本 AP P平台服务。本 APP 有权根据需要不定期地制订、修改本协议及/或各类规则，并在本 APP 平台公示，不再另行单独通知用户。变更后的协议和规则一经在 APP 公布，立即生效。如您不同意相关变更，应当立即停止使用本 APP 平台服务。您继续使用本 APP 平台服务的，即表明您接受修订后的协议和规则。" +
              "\n\n" +
              "二、本 APP 平台所刊载的所有资料及图表仅供参考使用。用户明确同意其使用本 APP 平台网络服务所存在的风险将完全由其自己承担；因其使用本 APP 平台网络服务而产生的一切后果也由其自己承担，本 APP 平台对用户不承担任何责任。" +
              "\n\n" +
              "三、本 APP 平台的用户在参加本 APP 平台举办的各种活动时，我们将在您的同意及确认下，通过注册表格等形式要求您提供一些个人资料，如：您的姓名、性别、年龄、出生日期、身份证号、家庭住址、教育程度、公司情况、所属行业等。我们在未经您同意的情况下，绝对不会将您的任何资料以任何方式泄露给任何第三方。" +
              "\n\n" +
              "四、当政府司法机关依照法定程序要求本 APP 平台披露个人资料时，我们将根据执法单位之要求或为公共安全之目的提供个人资料。在此情况下之任何披露，本 APP 平台均得免责。" +
              "\n\n" +
              "五、 任何由于黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营的不可抗力而造成的个人资料泄露、丢失、被盗用或被窜改等，本 APP 平台均得免责。" +
              "\n\n" +
              "六、由于与本 APP 平台链接的其它网站所造成之个人资料泄露及由此而导致的任何法律争议和后果，本 APP 平台均得免责。" +
              "\n\n" +
              "七、本 APP 平台如因系统维护或升级而需暂停服务时，将事先公告。若因线路及非本网站控制范围外的硬件故障或其它不可抗力而导致暂停服务，于暂停服务期间造成的一切不便与损失，本 APP 平台不负任何责任。" +
              "\n\n" +
              "八、本 APP 平台使用者因为违反本声明的规定而触犯中华人民共和国法律的，一切后果自己负责，本 APP 平台不承担任何责任。" +
              "\n\n" +
              "九、凡以任何方式登陆本 APP 平台或直接、间接使用本 APP 平台资料者，视为自愿接受本 APP 平台声明的约束。" +
              "\n\n"
                  "十、本声明未涉及的问题参见国家有关法律法规，当本声明与国家法律法规冲突时，以国家法律法规为准。" +
              "\n\n"
                  "十一、本 APP 平台不担保网络服务一定能满足用户的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。" +
              "\n\n"
                  "十二、本 APP 平台不保证为向用户提供便利而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本 APP 平台实际控制的任何网页或平台上的内容，本 APP 平台不承担任何责任。" +
              "\n\n"
                  "十三、对于因不可抗力或本 APP 平台不能控制的原因造成的网络服务中断或其它缺陷，本 APP 平台不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。" +
              "\n\n"
                  "十四、本 APP 平台所有页面的版式、图片版权均为本 APP 平台所有，未经授权，不得用于除本 APP 平台之外的任何站点。" +
              "\n\n"
                  "十五、本 APP 平台之声明以及其修改权、更新权及最终解释权均属本 APP 平台所有。" +
              "\n\n"
                  "©星辰缘"),
        ),
      ),
    );
  }
}
