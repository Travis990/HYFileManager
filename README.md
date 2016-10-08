# HYFileManager ![Pod version](http://img.shields.io/cocoapods/v/HYFileManager.svg) ![Pod platforms](http://img.shields.io/cocoapods/p/HYFileManager.svg) ![Pod license](http://img.shields.io/cocoapods/l/HYFileManager.svg)

### A Simple And Practical Tools Of iOS File Operations

HYFileManager is a simple tool of iOS file operations base on NSFileManager. It offers a range of static methods, only a small amount of code to handle file operations often need to deal with, making work easier and faster.
### Requirements
- iOS >= 5.0
- ARC enabled

### Features
- operate sandbox directory, use a simple syntax can be operated sandbox directory;
- traverse folder, based on deep values, and access the list of subdirectories;
- Get the file attributes, Including a list of all the attributes or a single attribute;
- Create a file, including the creation of folders, you can also choose whether content or overwrite parameters;
- Delete file, including deleted folder, two new static methods, you can clear the caches and tmp folders
- Copy and move file, including folder, you can easily move and copy the file;
- Get the filename and extension type;
- Determine whether a file exists, whether the file is empty, and whether the file is readable and writable;
- Get file size，include folder size, and provide two ways to return;
- Write to the file contents, support for basic data types, NSData, UIImage and NSCoding.

See [HYFileManager.h](https://github.com/castial/HYFileManager/HYFileManager/HYFileManager.h), and get detailed methodology description.

### Installation

#### CocoaPods:

`pod 'FCFileManager'`

#### Manual install:

Copy `FCFileManager.h` and `FCFileManager.m` to your project.

### Usage examples

#### Common sandbox directory

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

// home path
NSString *homePath = [HYFileManager homeDir];
```

#### Traverse folder

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

// Traverse library folder
NSArray *libraryArr = [HYFileManager listFilesInLibraryDirectoryByDeep:NO];
```
#### Get the file attributes
```
/*
All shortcuts suppported:

+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key;
+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error;
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path;
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error;
*/

// Get the file creation date
NSDate *date = (NSDate *)[HYFileManager attributeOfItemAtPath:path forKey:NSFileCreationDate error:error];
```
#### Create file or folder
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

// In the library folder, create a folder named test.
NSString *directoryPath = [NSString stringWithFormat:@"%@/test", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager createDirectoryAtPath:directoryPath];
```
#### Delete file or folder
```
/*
All shortcuts suppported:

+ (BOOL)removeItemAtPath:(NSString *)path;
+ (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error;
+ (BOOL)clearCachesDirectory;
+ (BOOL)clearTmpDirectory;
*/

// In the library folder, delete a folder named test.
NSString *directoryPath = [NSString stringWithFormat:@"%@/test", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager removeItemAtPath:directoryPath];
```
#### Copy file or folder
```
/*
All shortcuts suppported:

+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath;
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;
*/

// copy folder
NSError *error;
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy", [HYFileManager libraryDir]];
NSString *toPath = [NSString stringWithFormat:@"%@/hyyy", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager copyItemAtPath:path toPath:toPath overwrite:YES error:&error];
```
#### Move file or folder
```
/*
All shortcuts suppported:

+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath;
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;
*/

// move folder
NSError *error;
NSString *path = [NSString stringWithFormat:@"%@/hyyy", [HYFileManager libraryDir]];
NSString *toPath = [NSString stringWithFormat:@"%@/test/hyyy", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager moveItemAtPath:path toPath:toPath overwrite:YES error:&error];
```
#### Get the filename and extension type
```
/*
All shortcuts suppported:

+ (NSString *)fileNameAtPath:(NSString *)path suffix:(BOOL)suffix;
+ (NSString *)directoryAtPath:(NSString *)path;
+ (NSString *)suffixAtPath:(NSString *)path;

*/

// get the filename, including suffix.
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileManager libraryDir]];
NSString *fileName = [HYFileManager fileNameAtPath:path suffix:YES];
```
#### Determine whether a file exists
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

// whether a file exists
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileManager libraryDir]];
BOOL isExist = [HYFileManager isExistsAtPath:path];
```
#### Get file size
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

// get file size.
NSError *error;
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileManager libraryDir]];
NSNumber *size = [HYFileManager sizeOfFileAtPath:path error:&error];
```
#### Write to the file contents
```
/*
All shortcuts suppported:

+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content;
+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error;
*/

<<<<<<< HEAD
// write content
=======
// 写入文件内容
>>>>>>> origin/master
NSError *error;
NSString *path = [NSString stringWithFormat:@"%@/test/hyyy/file.md", [HYFileManager libraryDir]];
BOOL isSuccess = [HYFileManager writeFileAtPath:path content:@"Hello World" error:error];
```

##License
Released under [MIT License](LICENSE).

