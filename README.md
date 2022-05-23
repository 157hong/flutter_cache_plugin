# flutter_cache_plugin

A new Flutter project.

## Getting Started
# flutter_cache_plugin：



### 项目简介：

一个Flutter 获取应用缓存，及清理应用缓存的插件



### 项目优势和特色：





### 项目主要功能：

1. 获取应用缓存目录
2. 获取应用缓存大小
3. 清除缓存

### 项目开发过程：

1. 构建插件项目并通过MethodChannel调用原生方法
2. 获取应用缓存目录
3. 获取应用缓存大小
4. 清除缓存
5. 发布插件

#### 使用：

##### 添加插件：

##### <img src="C:\Users\admin\Desktop\flutter_plugin\04.jpg" alt="04" style="zoom:60%;" />



##### 获取应用缓存目录

获取用来装缓存数据的目录

##### <img src="01.jpg" alt="01" style="zoom:67%;" />



#####  获取应用缓存大小

根据文件循环计算出缓存文件的大小

<img src="02.jpg" alt="02" style="zoom:67%;" />



##### 清除缓存

通过递归的方式，删除缓存目录下所有的文件。

<img src="03.jpg" alt="03" style="zoom:67%;" />




