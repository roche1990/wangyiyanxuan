//
//  YXGoodsSpecHotCommentModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseModel.h"

@interface CommentReplyVO :NSObject
@property (nonatomic , assign) NSInteger              id;
@property (nonatomic , copy) NSString              * createTime;
@property (nonatomic , copy) NSString              * replyContent;
@property (nonatomic , copy) NSString              * replyerName;

@end

@interface YXGoodsSpecHotCommentDataModel : NSObject
@property (nonatomic , assign) NSInteger              id;
@property (nonatomic , copy) NSString              * appendCommentVO;
@property (nonatomic , assign) NSInteger              itemId;
@property (nonatomic , assign) NSInteger              packageId;
@property (nonatomic , copy) NSArray<NSString *>              * skuInfo;
@property (nonatomic , assign) NSInteger              memberLevel;
@property (nonatomic , assign) NSInteger               starVO;
@property (nonatomic , copy) NSString              * itemName;
@property (nonatomic , copy) NSString              * frontUserAvatar;
@property (nonatomic , copy) NSString              * frontUserName;
@property (nonatomic , assign) NSInteger              createTime;
@property (nonatomic , strong) CommentReplyVO              * commentReplyVO;
@property (nonatomic , copy) NSString              * itemIconUrl;
@property (nonatomic , assign) NSInteger              skuId;
@property (nonatomic , copy) NSArray<NSString *>              * picList;
@property (nonatomic , copy) NSString              * content;

/** <#注释#> */
@property (nonatomic, copy) NSString *skuString;

/** <#注释#> */
@property (nonatomic, copy) NSString *createTimeString;

/** <#name#> */
@property (nonatomic, assign) CGRect iconFrame;
/** <#name#> */
@property (nonatomic, assign) CGRect nameFrame;
/** <#name#> */
@property (nonatomic, assign) CGRect levelFrame;
/** <#name#> */
@property (nonatomic, assign) CGRect dateFrame;
/** <#name#> */
@property (nonatomic, assign) CGRect starFrame;
/** <#name#> */
@property (nonatomic, assign) CGRect commentFrame;
/** <#name#> */
@property (nonatomic, assign) CGRect commentImagesFrame;
/** <#name#> */
@property (nonatomic, assign) CGRect sizeFrame;
/** <#name#> */
@property (nonatomic, assign) CGRect replyFrame;

@end

@interface YXGoodsSpecHotCommentModel : YXGoodsSpecBaseModel

/** <#name#> */
@property (nonatomic, assign) CGFloat height;

/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecHotCommentDataModel *goodsSpecHotCommentDataModel;

@end
