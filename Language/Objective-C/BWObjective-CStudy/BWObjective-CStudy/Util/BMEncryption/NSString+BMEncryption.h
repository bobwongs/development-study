//
//  NSString+BMEncryption.h
//  DES加密
//
//  Created by ___liangdahong on 16/1/29.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BMEncryption)

@property (readonly)  NSString *bm_md5String;
@property (readonly)  NSString *bm_sha1String;
@property (readonly)  NSString *bm_sha256String;
@property (readonly)  NSString *bm_sha512String;

/**
 *  SHA1 加密
 *
 *  @param key 秘钥
 */

- (NSString *)bm_hmacSHA1StringWithKey:(NSString *)key;

/**
 *  SHA256 加密
 *
 *  @param key 秘钥
 */
- (NSString *)bm_hmacSHA256StringWithKey:(NSString *)key;

/**
 *  SHA512 加密
 *
 *  @param key 秘钥
 */
- (NSString *)bm_hmacSHA512StringWithKey:(NSString *)key;

/**
 *  DES 加密
 *
 *  @param key 秘钥
 */
- (NSString *)bm_DESEncryptionWithKey:(NSString *)key;

@end
