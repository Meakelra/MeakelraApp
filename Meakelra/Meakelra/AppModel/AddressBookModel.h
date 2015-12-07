//
//  AddressBookModel.h
//  Meakelra
//
//  Created by xiao_yu on 15/12/7.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressBookModel : NSObject

@property (nonatomic, assign) NSInteger sectionNumber;
@property (nonatomic, assign) NSInteger recordID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *tel;

@end
