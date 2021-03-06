# flutter_cache_plugin

A new Flutter project.


## 项目简介：

一个Flutter 获取应用缓存，及清理应用缓存的插件


## 项目优势和特色：

本插件把是否清理缓存的权限交由用户自己决定。

多数常见于IM类、电商类、资讯类、阅读类、视频类等APP会因为用户频繁的使用缓存较多的数据在本地，可能会占用手机较多的储存空间，需要单独设置清理缓存功能的app可以使用此插件快速开发。


## 项目主要功能：

1. 获取应用缓存目录
2. 获取应用缓存大小
3. 清除缓存


## 项目开发过程：

1. 构建插件项目并通过MethodChannel调用原生方法
2. 获取应用缓存目录
3. 获取应用缓存大小
4. 清除缓存
5. 测试
6. 发布插件

## 使用：

### 添加插件：

![04](https://user-images.githubusercontent.com/86814059/169726856-ef14070c-ff76-440b-a39c-c6e0a1d3b191.jpg)


### 获取应用缓存目录

获取用来装缓存数据的目录


![01](https://user-images.githubusercontent.com/86814059/169726874-99611f74-cb8d-4a9b-b437-942b01b3faff.jpg)



###  获取应用缓存大小

根据文件循环计算出缓存文件的大小

![02](https://user-images.githubusercontent.com/86814059/169726881-4bd56bd8-7d67-41b8-9293-9150f088b654.jpg)




### 清除缓存

通过递归的方式，删除缓存目录下所有的文件。


![03](https://user-images.githubusercontent.com/86814059/169726887-7b4c036f-be46-4175-9b52-3b798f1022b7.jpg)


## 项目总结

了解Android内部存储和外部储存

学会编写插件，发布插件
