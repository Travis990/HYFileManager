### 简单实用的iOS文件工具类

HYFileManager一个基于NSFileManager的文件操作类，它提供一系列的静态方法，只用少量的代码，来处理经常需要处理的文件操作，使得工作更加方便快捷。

### 要求
- iOS >= 5.0
- ARC环境

### 特性

- 沙盒日常操作目录集合，简单语法即可获取目录路径；
- 遍历文件夹，包含两种方式，深遍历和浅遍历；
- 获取文件属性，包含单个属性获取方法和所有属性获取方法；
- 创建文件(夹)，创建文件夹，文件，可以根据所需，是否需要覆盖，是否需要默认内容来创建；
- 删除文件(夹)，提供两个静态方法来快速实现清空Caches和tmp文件夹内容；
- 复制、移动文件(夹)，可以选择是否需要覆盖来对文件(夹)进行复制和移动；
- 根据目录路径来获取文件名和文件扩展类型；
- 判断文件(夹)是否存在、文件(夹)判空、判断路径是否为文件或者文件夹、已经判断目录是否可读可写；
- 获取文件(夹)的大小，提供两种返回方式，NSNumber和NSString，方便开发使用；
- 写入文件内容，支持基本数据类型、NSData、UIImage和NSCoding类型。

查看 [HYFileManager.h](https://github.com/castial/HYFileManager/HYFileManager/HYFileManager.h)，获取方法详细介绍。

### 安装

#### CocoaPods:

`pod 'FCFileManager'`

#### 下载HYFileManager:

下载HYFileManager，将HYFileManager拖动到你的使用工程中即可。

### 使用实例

#### 常见沙盒目录
```
/*
All shortcuts suppported:

+ (NSString *)homeDir;
+ (NSString *)documentsDir;
+ (NSString *)libraryDir;
+ (NSString *)preferencesDir;
+ (NSString *)cachesDir;
+ (NSString *)tmpDir;
*/

// 沙盒目录
NSString *homePath = [HYFileManager homeDir];
```
#### 遍历文件夹
```
/*
All shortcuts suppported:

+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep;
+ (NSArray *)listFilesInHomeDirectoryByDeep:(BOOL)deep;
+ (NSArray *)listFilesInDocumentDirectoryByDeep:(BOOL)deep;
+ (NSArray *)listFilesInLibraryDirectoryByDeep:(BOOL)deep;
+ (NSArray *)listFilesInCachesDirectoryByDeep:(BOOL)deep;
+ (NSArray *)listFilesInTmpDirectoryByDeep:(BOOL)deep;
*/

// 遍历library文件夹
NSArray *libraryArr = [HYFileManager listFilesInLibraryDirectoryByDeep:NO];
```
#### 获取文件属性
```
/*
All shortcuts suppported:

+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key;
+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error;
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path;
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error;
*/

// 获取文件创建时间
NSDate *date = (NSDate *)[HYFileManager attributeOfItemAtPath:path forKey:NSFileCreationDate error:error];
```
#### 创建文件(夹)
```
/*
All shortcuts suppported:

+ (BOOL)createDirectoryAtPath:(NSString *)path;
+ (BOOL)createDirectoryAtPath:(NSString *)path error:(NSError **)error;
+ (BOOL)createFileAtPath:(NSString *)path;
+ (BOOL)createFileAtPath:(NSString *)path error:(NSError **)error;
+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite;
+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError **)error;
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content;
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error;
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content overwrite:(BOOL)overwrite;
+ (BOOL)createFileAtPath:(NSString *)path content:(NSObject *)content overwrite:(BOOL)overwrite error:(NSError **)error;
+ (NSDate *)creationDateOfItemAtPath:(NSString *)path;
+ (NSDate *)creationDateOfItemAtPath:(NSString *)path error:(NSError **)error;
+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path;
+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path error:(NSError **)error;
*/

// library下创建一个test文件夹
NSString *directoryPath = [NSString stringWithFormat:@"%@/test", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager createDirectoryAtPath:directoryPath];
```
#### 删除文件(夹)
```
/*
All shortcuts suppported:

+ (BOOL)removeItemAtPath:(NSString *)path;
+ (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error;
+ (BOOL)clearCachesDirectory;
+ (BOOL)clearTmpDirectory;
*/

// 删除library下的test文件夹
NSString *directoryPath = [NSString stringWithFormat:@"%@/test", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager removeItemAtPath:directoryPath];
```
#### 复制文件(夹)
```
/*
All shortcuts suppported:

+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath;
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;
*/

// 复制文件夹
NSError *error;
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy", [HYFileManager libraryDir]];
NSString *toPath = [NSString stringWithFormat:@"%@/hyyy", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager copyItemAtPath:path toPath:toPath overwrite:YES error:&error];
```
#### 移动文件(夹)
```
/*
All shortcuts suppported:

+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath;
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;
*/

// 移动文件夹
NSError *error;
NSString *path = [NSString stringWithFormat:@"%@/hyyy", [HYFileManager libraryDir]];
NSString *toPath = [NSString stringWithFormat:@"%@/test/hyyy", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager moveItemAtPath:path toPath:toPath overwrite:YES error:&error];
```
#### 获取文件名和扩展类型
```
/*
All shortcuts suppported:

+ (NSString *)fileNameAtPath:(NSString *)path suffix:(BOOL)suffix;
+ (NSString *)directoryAtPath:(NSString *)path;
+ (NSString *)suffixAtPath:(NSString *)path;

*/

// 获取文件夹名称，带后缀
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileManager libraryDir]];
NSString *fileName = [HYFileManager fileNameAtPath:path suffix:YES];
```
#### 文件(夹)是否存在、判空和可读可写
```
/*
All shortcuts suppported:

+ (BOOL)isExistsAtPath:(NSString *)path;
+ (BOOL)isEmptyItemAtPath:(NSString *)path;
+ (BOOL)isEmptyItemAtPath:(NSString *)path error:(NSError **)error;
+ (BOOL)isDirectoryAtPath:(NSString *)path;
+ (BOOL)isDirectoryAtPath:(NSString *)path error:(NSError **)error;
+ (BOOL)isFileAtPath:(NSString *)path;
+ (BOOL)isFileAtPath:(NSString *)path error:(NSError **)error;
+ (BOOL)isExecutableItemAtPath:(NSString *)path;
+ (BOOL)isReadableItemAtPath:(NSString *)path;
+ (BOOL)isWritableItemAtPath:(NSString *)path;
*/

// 判断目录是否存在
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileManager libraryDir]];
BOOL isExist = [HYFileManager isExistsAtPath:path];
```
#### 获取文件(夹)大小
```
/*
All shortcuts suppported:

+ (NSNumber *)sizeOfItemAtPath:(NSString *)path;
+ (NSNumber *)sizeOfItemAtPath:(NSString *)path error:(NSError **)error;
+ (NSNumber *)sizeOfFileAtPath:(NSString *)path;
+ (NSNumber *)sizeOfFileAtPath:(NSString *)path error:(NSError **)error;
+ (NSNumber *)sizeOfDirectoryAtPath:(NSString *)path;
+ (NSNumber *)sizeOfDirectoryAtPath:(NSString *)path error:(NSError **)error;

+ (NSString *)sizeFormattedOfItemAtPath:(NSString *)path;
+ (NSString *)sizeFormattedOfItemAtPath:(NSString *)path error:(NSError **)error;
+ (NSString *)sizeFormattedOfFileAtPath:(NSString *)path;
+ (NSString *)sizeFormattedOfFileAtPath:(NSString *)path error:(NSError **)error;
+ (NSString *)sizeFormattedOfDirectoryAtPath:(NSString *)path;
+ (NSString *)sizeFormattedOfDirectoryAtPath:(NSString *)path error:(NSError **)error;
*/

// 获取文件大小
NSError *error;
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileManager libraryDir]];
NSNumber *size = [HYFileManager sizeOfFileAtPath:path error:&error];
```
#### 写入文件内容
```
/*
All shortcuts suppported:

+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content;
+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error;
*/

// 遍历library文件夹
NSError *error;
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager writeFileAtPath:path content:@"Hello World" error:error];
```

##License
Released under [MIT License](LICENSE).

