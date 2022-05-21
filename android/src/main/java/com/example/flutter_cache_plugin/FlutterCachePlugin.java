package com.example.flutter_cache_plugin;

import android.content.Context;
import android.os.Environment;

import androidx.annotation.NonNull;

import java.io.File;
import java.text.DecimalFormat;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterCachePlugin */
public class FlutterCachePlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;  // 通道
  private Context applicationContext;  // 上下文

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    applicationContext = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_cache_plugin");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method){
      case "getTemporaryDirectory":{   // 缓存路径
        result.success(CacheDataManager.geTemporaryDirectory(applicationContext));
        break;
      }
      case "getTotalCacheSize":{  // 缓存大小
        result.success(CacheDataManager.getTotalCacheSize(applicationContext));
        break;
      }
      case "clearAllCache":{  // 清除缓存
        result.success(CacheDataManager.clearAllCache(applicationContext));
        break;
      }
      default:{
        result.notImplemented();
        break;
      }
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }


  public static class CacheDataManager {

    /**
     * 获取缓存目录
     * @param context
     * @return
     */
    public static String geTemporaryDirectory(Context context) {
      return context.getCacheDir().getPath();
    }

    /**
     * 获取总缓存大小
     * @param context
     * @return
     * 如果Android应用程序需要缓存临时文件，系统提供了一个可管理的“内部缓存”和一个不可管理的“外部缓存”，
     * 分别调用getCacheDir()和getExternalCacheDir()方法，可以从当前上下文(context)访问它们。
     */
    public static String getTotalCacheSize(Context context) {

      long cacheSize = getFolderSize(context.getCacheDir());
      // 是否有SD卡
      if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
        cacheSize += getFolderSize(context.getExternalCacheDir());
      }
      return byteToString(cacheSize);
    }

    /**
     * 获取文件夹大小
     * Context.getExternalFilesDir() --> SDCard/Android/data/你的应用的包名/files/ 目录，一般放一些长时间保存的数据
     * Context.getExternalCacheDir() --> SDCard/Android/data/你的应用包名/cache/目录，一般存放临时缓存数据
     * @param file
     * @return
     */
    public static long getFolderSize(File file){
      long size = 0;
      try {
        File[] fileList = file.listFiles();
        for (int i = 0; i < fileList.length; i++) {
          // 如果下面还有文件
          if (fileList[i].isDirectory()) {
            size = size + getFolderSize(fileList[i]);
          } else {
            size = size + fileList[i].length();
          }
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
      return size;
    }

    /**
     * 格式化单位
     * @param size
     * @return
     */
    public static final String byteToString(long size) {

      long GB = 1024 * 1024 * 1024;//定义GB的计算常量
      long MB = 1024 * 1024;//定义MB的计算常量
      long KB = 1024;//定义KB的计算常量
      DecimalFormat df = new DecimalFormat("0.00");//格式化小数
      String resultSize = "";
      if (size / GB >= 1) {
        //如果当前Byte的值大于等于1GB
        resultSize = df.format(size / (float) GB) + " GB   ";
      } else if (size / MB >= 1) {
        //如果当前Byte的值大于等于1MB
        resultSize = df.format(size / (float) MB) + " MB   ";
      } else if (size / KB >= 1) {
        //如果当前Byte的值大于等于1KB
        resultSize = df.format(size / (float) KB) + " KB   ";
      } else {
        resultSize = size + " B   ";
      }
      return resultSize;
    }

    /**
     * 清除所有缓存
     * @param context
     * @return
     */
    public static boolean clearAllCache(Context context) {
      deleteDir(context.getCacheDir());
      if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
        deleteDir(context.getExternalCacheDir());
      }
      return true;
    }

    /**
     * 删除目录
     * @param dir
     * @return
     */
    private static boolean deleteDir(File dir) {
      if (dir != null && dir.isDirectory()) {
        String[] children = dir.list();
        for (int i = 0; i < children.length; i++) {
          boolean success = deleteDir(new File(dir, children[i]));
          if (!success) {
            return false;
          }
        }
      }
      return dir.delete();
    }
  }

}
