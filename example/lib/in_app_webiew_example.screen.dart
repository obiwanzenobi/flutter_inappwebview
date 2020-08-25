import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'main.dart';

class InAppWebViewExampleScreen extends StatefulWidget {
  @override
  _InAppWebViewExampleScreenState createState() =>
      new _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<InAppWebViewExampleScreen> {
  InAppWebViewController webView;
  ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  CookieManager _cookieManager = CookieManager.instance();
  int height;

  @override
  void initState() {
    super.initState();

    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              androidId: 1,
              iosId: "1",
              title: "Special",
              action: () async {
                print("Menu item Special clicked!");
                print(await webView.getSelectedText());
                await webView.clearFocus();
              })
        ],
        options: ContextMenuOptions(hideDefaultSystemContextMenuItems: true),
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await webView.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = (Platform.isAndroid)
              ? contextMenuItemClicked.androidId
              : contextMenuItemClicked.iosId;
          print("onContextMenuActionItemClicked: " +
              id.toString() +
              " " +
              contextMenuItemClicked.title);
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("InAppWebView")),
        drawer: myDrawer(context: context),
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
                "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                height: height?.toDouble() ?? 100.0,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: InAppWebView(
                    contextMenu: contextMenu,
                    initialData: InAppWebViewInitialData(
                        data: """"<html><head></head><body contenteditable=\"true\" onload=\"parent.document.getElementById('lps/TEST/RENDERER/1597735794520_2').loadAds(window,false)\" leftmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" style=\"background: transparent\" topmargin=\"0\"><p></p><!-- [if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--><p></p><!-- [if !mso]><!--><p></p><!--<![endif]--><p></p><!-- [if !mso]><!--><p></p><!--<![endif]--><style type=\"text/css\">\t\tbody {\t\t\tmargin: 0;\t\t\tpadding: 0;\t\t}\t\ttable,\t\ttd,\t\ttr {\t\t\tvertical-align: top;\t\t\tborder-collapse: collapse;\t\t}\t\t* {\t\t\tline-height: inherit;\t\t}\t\ta[x-apple-data-detectors=true] {\t\t\tcolor: inherit !important;\t\t\ttext-decoration: none !important;\t\t}\t</style><style id=\"media-query\" type=\"text/css\">\t\t@media (max-width: 520px) {\t\t\t.block-grid,\t\t\t.col {\t\t\t\tmin-width: 320px !important;\t\t\t\tmax-width: 100% !important;\t\t\t\tdisplay: block !important;\t\t\t}\t\t\t.block-grid {\t\t\t\twidth: 100% !important;\t\t\t}\t\t\t.col {\t\t\t\twidth: 100% !important;\t\t\t}\t\t\t.col>div {\t\t\t\tmargin: 0 auto;\t\t\t}\t\t\timg.fullwidth,\t\t\timg.fullwidthOnMobile {\t\t\t\tmax-width: 100% !important;\t\t\t}\t\t\t.no-stack .col {\t\t\t\tmin-width: 0 !important;\t\t\t\tdisplay: table-cell !important;\t\t\t}\t\t\t.no-stack.two-up .col {\t\t\t\twidth: 50% !important;\t\t\t}\t\t\t.no-stack .col.num4 {\t\t\t\twidth: 33% !important;\t\t\t}\t\t\t.no-stack .col.num8 {\t\t\t\twidth: 66% !important;\t\t\t}\t\t\t.no-stack .col.num4 {\t\t\t\twidth: 33% !important;\t\t\t}\t\t\t.no-stack .col.num3 {\t\t\t\twidth: 25% !important;\t\t\t}\t\t\t.no-stack .col.num6 {\t\t\t\twidth: 50% !important;\t\t\t}\t\t\t.no-stack .col.num9 {\t\t\t\twidth: 75% !important;\t\t\t}\t\t\t.video-block {\t\t\t\tmax-width: none !important;\t\t\t}\t\t\t.mobile_hide {\t\t\t\tmin-height: 0px;\t\t\t\tmax-height: 0px;\t\t\t\tmax-width: 0px;\t\t\t\tdisplay: none;\t\t\t\toverflow: hidden;\t\t\t\tfont-size: 0px;\t\t\t}\t\t\t.desktop_hide {\t\t\t\tdisplay: block !important;\t\t\t\tmax-height: none !important;\t\t\t}\t\t}\t</style><!-- [if IE]><div class=\"ie-browser\"><![endif]--><table bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ffffff; width: 100%;\" valign=\"top\" width=\"100%\"><tbody><tr style=\"vertical-align: top;\" valign=\"top\"><td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color:#ffffff\"><![endif]--><div style=\"background-color: transparent;\"><div class=\"block-grid\" style=\"margin: 0 auto; min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #e8e4e5;\"><div style=\"border-collapse: collapse; display: table; width: 100%; background-color: #e8e4e5;\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"background-color:transparent;\"><tr><td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px\"><tr class=\"layout-full-width\" style=\"background-color:#e8e4e5\"><![endif]--> <!-- [if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"background-color:#e8e4e5;width:500px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;\"><![endif]--><div class=\"col num12\" style=\"min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px;\"><div style=\"width: 100% !important;\"><!-- [if (!mso)&(!IE)]><!--><div style=\"border: 0px solid transparent; padding: 5px 0px 5px 0px;\"><!--<![endif]--><div align=\"center\" class=\"img-container center autowidth\" style=\"padding-right: 0px; padding-left: 0px;\"><!-- [if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr style=\"line-height:0px\"><td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\"><![endif]--><a href=\"" target=\"_blank\" rel=\"noopener\"><img align=\"center\" alt=\"Alternate text\" border=\"0\" class=\"center autowidth\" src=\"cid:1597735794.458084079@0.jpeg\" style=\"text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 500px; display: block;\" title=\"Alternate text\" width=\"500\"></a> <!-- [if mso]></td></tr></table><![endif]--></div><!-- [if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--> <!-- [if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div></div></div><div style=\"background-color: transparent;\"><div class=\"block-grid\" style=\"margin: 0 auto; min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #e8e4e5;\"><div style=\"border-collapse: collapse; display: table; width: 100%; background-color: #e8e4e5;\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"background-color:transparent;\"><tr><td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px\"><tr class=\"layout-full-width\" style=\"background-color:#e8e4e5\"><![endif]--> <!-- [if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"background-color:#e8e4e5;width:500px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 0px; padding-left: 0px; padding-top:0px; padding-bottom:5px;\"><![endif]--><div class=\"col num12\" style=\"min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px;\"><div style=\"width: 100% !important;\"><!-- [if (!mso)&(!IE)]><!--><div style=\"border: 0px solid transparent; padding: 0px 0px 5px 0px;\"><!--<![endif]--><div align=\"center\" class=\"img-container center autowidth\" style=\"padding-right: 0px; padding-left: 0px;\"><!-- [if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr style=\"line-height:0px\"><td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\"><![endif]--><a href=\"" target=\"_blank\" rel=\"noopener\"><img align=\"center\" alt=\"Alternate text\" border=\"0\" class=\"center autowidth\" src=\"cid:1597735794.3668719125@1.png\" style=\"text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 500px; display: block;\" title=\"Alternate text\" width=\"500\"></a> <!-- [if mso]></td></tr></table><![endif]--></div><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\"><tbody><tr style=\"vertical-align: top;\" valign=\"top\"><td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 10px;\" valign=\"top\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #9D0002; width: 100%;\" valign=\"top\" width=\"100%\"><tbody><tr style=\"vertical-align: top;\" valign=\"top\"><td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td></tr></tbody></table></td></tr></tbody></table><!-- [if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--> <!-- [if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div></div></div><div style=\"background-color: transparent;\"><div class=\"block-grid\" style=\"margin: 0 auto; min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #e8e4e5;\"><div style=\"border-collapse: collapse; display: table; width: 100%; background-color: #e8e4e5;\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"background-color:transparent;\"><tr><td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px\"><tr class=\"layout-full-width\" style=\"background-color:#e8e4e5\"><![endif]--> <!-- [if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"background-color:#e8e4e5;width:500px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;\"><![endif]--><div class=\"col num12\" style=\"min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px;\"><div style=\"width: 100% !important;\"><!-- [if (!mso)&(!IE)]><!--><div style=\"border: 0px solid transparent; padding: 5px 0px 5px 0px;\"><!--<![endif]--> <!-- [if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 10px; padding-left: 10px; padding-top: 0px; padding-bottom: 10px; font-family: Georgia, 'Times New Roman', serif\"><![endif]--><div style=\"color: #555555; font-family: Georgia, Times, 'Times New Roman', serif; line-height: 1.2; padding: 0px 10px 0px 10px;\"><div style=\"line-height: 1.2; font-size: 12px; font-family: Georgia, Times, 'Times New Roman', serif; color: #555555; mso-line-height-alt: 14px;\"><p style=\"font-size: 15px; line-height: 1.2; word-break: break-word; text-align: center; font-family: Georgia, Times, 'Times New Roman', serif; mso-line-height-alt: 18px; margin: 0;\"><span style=\"font-size: 15px; color: #000000;\"><strong>Ta metoda sprawi, że w tym roku Twój samochód będzie idealnie prezentował się podczas urlopu!</strong></span></p></div></div><!-- [if mso]></td></tr></table><![endif]--> <!-- [if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--> <!-- [if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div></div></div><div style=\"background-color: transparent;\"><div class=\"block-grid\" style=\"margin: 0 auto; min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #e8e4e5;\"><div style=\"border-collapse: collapse; display: table; width: 100%; background-color: #e8e4e5;\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"background-color:transparent;\"><tr><td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px\"><tr class=\"layout-full-width\" style=\"background-color:#e8e4e5\"><![endif]--> <!-- [if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"background-color:#e8e4e5;width:500px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;\"><![endif]--><div class=\"col num12\" style=\"min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px;\"><div style=\"width: 100% !important;\"><!-- [if (!mso)&(!IE)]><!--><div style=\"border: 0px solid transparent; padding: 0px;\"><!--<![endif]--><div align=\"center\" class=\"img-container center autowidth\" style=\"padding-right: 0px; padding-left: 0px;\"><!-- [if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr style=\"line-height:0px\"><td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\"><![endif]--><a href=\"" target=\"_blank\" rel=\"noopener\"><img align=\"center\" alt=\"Alternate text\" border=\"0\" class=\"center autowidth\" src=\"cid:1597735794.3728409615@2.gif\" style=\"text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 500px; display: block;\" title=\"Alternate text\" width=\"500\"></a> <!-- [if mso]></td></tr></table><![endif]--></div><!-- [if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--> <!-- [if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div></div></div><div style=\"background-color: transparent;\"><div class=\"block-grid\" style=\"margin: 0 auto; min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #e8e4e5;\"><div style=\"border-collapse: collapse; display: table; width: 100%; background-color: #e8e4e5;\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"background-color:transparent;\"><tr><td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px\"><tr class=\"layout-full-width\" style=\"background-color:#e8e4e5\"><![endif]--> <!-- [if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"background-color:#e8e4e5;width:500px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;\"><![endif]--><div class=\"col num12\" style=\"min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px;\"><div style=\"width: 100% !important;\"><!-- [if (!mso)&(!IE)]><!--><div style=\"border: 0px solid transparent; padding: 5px 0px 5px 0px;\"><!--<![endif]--> <!-- [if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 5px; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; font-family: Georgia, 'Times New Roman', serif\"><![endif]--><div style=\"color: #000000; font-family: Georgia, Times, 'Times New Roman', serif; line-height: 1.2; padding: 5px;\"><div style=\"line-height: 1.2; font-size: 12px; color: #000000; font-family: Georgia, Times, 'Times New Roman', serif; mso-line-height-alt: 14px;\"><p style=\"font-size: 18px; line-height: 1.2; text-align: center; word-break: break-word; mso-line-height-alt: 22px; margin: 0;\"><span style=\"font-size: 18px;\"><strong>Profesjonalny preparat polecany przez ekspertów! </strong></span></p><p style=\"font-size: 18px; line-height: 1.2; text-align: center; word-break: break-word; mso-line-height-alt: 22px; margin: 0;\"><span style=\"font-size: 18px;\"><strong>Z NanoArmor 600 osiągniesz:</strong></span></p><ul><li style=\"line-height: 1.2; text-align: left; font-size: 16px; mso-line-height-alt: 19px;\"><span style=\"font-size: 16px;\">diamentowy połysk lakieru – <strong>efekt lustra</strong></span></li><li style=\"line-height: 1.2; font-size: 16px; mso-line-height-alt: 19px;\"><span style=\"font-size: 16px;\">wysoki stopień twardości – odporność na zarysowania i przetarcia</span></li><li style=\"line-height: 1.2; font-size: 16px; mso-line-height-alt: 19px;\"><span style=\"font-size: 16px;\"><strong>pełną</strong> <strong>ochronę</strong> przed działaniem szkodliwych czynników zewnętrznych </span></li><li style=\"line-height: 1.2; font-size: 16px; mso-line-height-alt: 19px;\"><span style=\"font-size: 16px;\">maksymalną hydrofobowość powierzchni – <strong style=\"background-color: transparent;\">odpychanie wody i brudu</strong></span></li></ul></div></div><!-- [if mso]></td></tr></table><![endif]--> <!-- [if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--> <!-- [if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div></div></div><div style=\"background-color: transparent;\"><div class=\"block-grid\" style=\"margin: 0 auto; min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #e8e4e5;\"><div style=\"border-collapse: collapse; display: table; width: 100%; background-color: #e8e4e5;\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"background-color:transparent;\"><tr><td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px\"><tr class=\"layout-full-width\" style=\"background-color:#e8e4e5\"><![endif]--> <!-- [if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"background-color:#e8e4e5;width:500px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;\"><![endif]--><div class=\"col num12\" style=\"min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px;\"><div style=\"width: 100% !important;\"><!-- [if (!mso)&(!IE)]><!--><div style=\"border: 0px solid transparent; padding: 5px 0px 5px 0px;\"><!--<![endif]--><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\"><tbody><tr style=\"vertical-align: top;\" valign=\"top\"><td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 10px;\" valign=\"top\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #9D0002; width: 100%;\" valign=\"top\" width=\"100%\"><tbody><tr style=\"vertical-align: top;\" valign=\"top\"><td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td></tr></tbody></table></td></tr></tbody></table><!-- [if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 20px; padding-left: 20px; padding-top: 20px; padding-bottom: 20px; font-family: Georgia, 'Times New Roman', serif\"><![endif]--><div style=\"color: #000000; font-family: Georgia, Times, 'Times New Roman', serif; line-height: 1.2; padding: 20px 20px 0px 20px;\"><div style=\"line-height: 1.2; font-family: Georgia, Times, 'Times New Roman', serif; font-size: 12px; color: #000000; mso-line-height-alt: 14px;\"><p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; font-family: Georgia, Times, 'Times New Roman', serif; mso-line-height-alt: 22px; margin: 0;\"><span style=\"font-size: 18px;\"><strong>Fakt, że już 115 tysięcy Polaków cieszy się z odnowienia swojego auta, pokazuje, że Ty też możesz tego dokonać!</strong></span></p></div></div><!-- [if mso]></td></tr></table><![endif]--> <!-- [if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--> <!-- [if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div></div></div><div style=\"background-color: transparent;\"><div class=\"block-grid\" style=\"margin: 0 auto; min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #e8e4e5;\"><div style=\"border-collapse: collapse; display: table; width: 100%; background-color: #e8e4e5;\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"background-color:transparent;\"><tr><td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px\"><tr class=\"layout-full-width\" style=\"background-color:#e8e4e5\"><![endif]--> <!-- [if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"background-color:#e8e4e5;width:500px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;\"><![endif]--><div class=\"col num12\" style=\"min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px;\"><div style=\"width: 100% !important;\"><!-- [if (!mso)&(!IE)]><!--><div style=\"border: 0px solid transparent; padding: 5px 0px 5px 0px;\"><!--<![endif]--><div align=\"center\" class=\"img-container center fixedwidth\" style=\"padding-right: 0px; padding-left: 0px;\"><!-- [if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr style=\"line-height:0px\"><td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\"><![endif]--><a href=\"" target=\"_blank\" rel=\"noopener\"><img align=\"center\" alt=\"Alternate text\" border=\"0\" class=\"center fixedwidth\" src=\"cid:1597735794.1852913503@3.gif\" style=\"text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 500px; display: block;\" title=\"Alternate text\" width=\"500\"></a> <!-- [if mso]></td></tr></table><![endif]--></div><!-- [if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--> <!-- [if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div></div></div><div style=\"background-color: transparent;\"><div class=\"block-grid\" style=\"margin: 0 auto; min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #e8e4e5;\"><div style=\"border-collapse: collapse; display: table; width: 100%; background-color: #e8e4e5;\"><!-- [if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"background-color:transparent;\"><tr><td align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px\"><tr class=\"layout-full-width\" style=\"background-color:#e8e4e5\"><![endif]--> <!-- [if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"background-color:#e8e4e5;width:500px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;\"><![endif]--><div class=\"col num12\" style=\"min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px;\"><div style=\"width: 100% !important;\"><!-- [if (!mso)&(!IE)]><!--><div style=\"border: 0px solid transparent; padding: 0px;\"><!--<![endif]--><div align=\"center\" class=\"img-container center autowidth\" style=\"padding-right: 5px; padding-left: 5px;\"><!-- [if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr style=\"line-height:0px\"><td style=\"padding-right: 5px;padding-left: 5px;\" align=\"center\"><![endif]--><div style=\"font-size: 1px; line-height: 5px;\"> </div><a href=\"" target=\"_blank\" rel=\"noopener\"><img align=\"center\" alt=\"Alternate text\" border=\"0\" class=\"center autowidth\" src=\"cid:1597735794.825951725@4.png\" style=\"text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 100px; display: block;\" title=\"Alternate text\" width=\"100\"></a><div style=\"font-size: 1px; line-height: 5px;\"> </div><!-- [if mso]></td></tr></table><![endif]--></div><!-- [if (!mso)&(!IE)]><!--></div><!--<![endif]--></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--> <!-- [if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div></div></div><!-- [if (mso)|(IE)]></td></tr></table><![endif]--></td></tr></tbody></table><!-- [if (IE)]></div><![endif]--><p style=\"color: inherit; font-family: Verdana,Tahoma,Arial,Sans; font-size: 9px !important; line-height: 13px;\">Wiadomość przesłana przez </p><p style=\"color: inherit; font-family: Verdana,Tahoma,Arial,Sans; font-size: 9px !important; line-height: 13px;\">a href=\"" target=\"_blank\" rel=\"noopener noreferrer\">Regulaminem</a>. <a href=\"" target=\"_blank\" rel=\"noopener noreferrer\">mail@mail.com</a></p><p style=\"color: inherit; font-family: Verdana,Tahoma,Arial,Sans; font-size: 9px !important; line-height: 13px;\">Weryfikacja listu: <a data-dnt=\"1\" href=\"" target=\"_blank\" rel=\"noopener noreferrer\">link weryfikacyjny</a></p><img width=\"1\" data-embed=\"0\" height=\"1\" border=\"0\" src=\""></body></html>";""",
                    ),
                    initialHeaders: {},
                    onContentSizeChanged: (width, height) async {
                      var contentHeight = await webView.getContentHeight();
                      print("new height! $height, content: $contentHeight");
                      if(contentHeight != this.height) {
                        setState(() {
                          this.height = contentHeight;
                        });
                      }
                    },
                    initialOptions: InAppWebViewGroupOptions(
                      android: AndroidInAppWebViewOptions(
                        useWideViewPort: false,
                        wrapContentHeight: true
                      ),
                      crossPlatform: InAppWebViewOptions(
                        debuggingEnabled: true,
                        useShouldOverrideUrlLoading: true,
                      ),
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                      print("onWebViewCreated");
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {
                      print("onLoadStart $url");
                      setState(() {
                        this.url = url;
                      });
                    },
                    shouldOverrideUrlLoading:
                        (controller, shouldOverrideUrlLoadingRequest) async {
                      var url = shouldOverrideUrlLoadingRequest.url;
                      var uri = Uri.parse(url);

                      if (![
                        "http",
                        "https",
                        "file",
                        "chrome",
                        "data",
                        "javascript",
                        "about"
                      ].contains(uri.scheme)) {
//                        if (await canLaunch(url)) {
//                          // Launch the App
//                          await launch(
//                            url,
//                          );
//                          // and cancel the request
//                          return ShouldOverrideUrlLoadingAction.CANCEL;
//                        }
                      }

                      return ShouldOverrideUrlLoadingAction.ALLOW;
                    },
                    onLoadStop:
                        (InAppWebViewController controller, String url) async {
                      print("onLoadStop $url");
                      setState(() {
                        this.url = url;
                      });

                      try {
                        int height = await webView.getContentHeight();
                        setState(() {
                          this.height = height;
                        });
                      } catch (e, stack) {
                        print("Webview error");
                      }
                    },
                    onProgressChanged:
                        (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                    onUpdateVisitedHistory: (InAppWebViewController controller,
                        String url, bool androidIsReload) {
                      print("onUpdateVisitedHistory $url");
                      setState(() {
                        this.url = url;
                      });
                    }),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  if (webView != null) {
                    webView.goBack();
                  }
                },
              ),
              RaisedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  if (webView != null) {
                    webView.goForward();
                  }
                },
              ),
              RaisedButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  if (webView != null) {
                    webView.reload();
                  }
                },
              ),
            ],
          ),
        ])));
  }
}
