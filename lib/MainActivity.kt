package br.com.browser.details

import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ResolveInfo
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val BROWSERDETAILSCHANNEL = "browserDetails"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BROWSERDETAILSCHANNEL).setMethodCallHandler {
                call,
                result ->
            if (call.method == "getPackageName") {
                val browserIntent = Intent("android.intent.action.VIEW", Uri.parse("http://"))
                val resolveInfo: ResolveInfo? =
                        packageManager.resolveActivity(
                                browserIntent,
                                PackageManager.MATCH_DEFAULT_ONLY
                        )
                val packageName: String? = resolveInfo?.activityInfo?.packageName

                result.success(packageName)
            } else {
                result.notImplemented()
            }
        }
    }
}

