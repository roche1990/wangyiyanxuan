//
//  YXGoodsSpecRecommedationModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseModel.h"

@class YXGoodsSpecRecommedationItemTagModel;

@interface GradientPrice :NSObject
@property (nonatomic , assign) NSInteger              limitPrice;
@property (nonatomic , assign) BOOL              isActived;
@property (nonatomic , assign) NSInteger              leftTime;
@property (nonatomic , assign) NSInteger              restDay;

@end

@interface YXGoodsSpecRecommedationDataModel : NSObject

@property (nonatomic , assign) NSInteger              pointsPrice;
@property (nonatomic , assign) NSInteger              onSaleTime;
@property (nonatomic , assign) NSInteger              preLimitFlag;
@property (nonatomic , copy) NSString              * listPicUrl;
@property (nonatomic , assign) NSInteger              id;
@property (nonatomic , assign) NSInteger              retailPrice;
@property (nonatomic , assign) NSInteger              colorNum;
@property (nonatomic , assign) NSInteger              autoOnsaleTime;
@property (nonatomic , assign) NSInteger              rank;
@property (nonatomic , assign) BOOL              soldOut;
@property (nonatomic , assign) NSInteger              commentCount;
@property (nonatomic , assign) BOOL              newItemFlag;
@property (nonatomic , assign) NSInteger              points;
@property (nonatomic , assign) BOOL              itemSizeTableFlag;
@property (nonatomic , assign) NSInteger              primarySkuPreSellStatus;
@property (nonatomic , copy) NSArray<YXGoodsSpecRecommedationItemTagModel *>              * itemTagList;
@property (nonatomic , copy) NSString              * pieceUnitDesc;
@property (nonatomic , assign) NSInteger              preemptionStatus;
@property (nonatomic , assign) NSInteger              primarySkuPreSellPrice;
@property (nonatomic , assign) NSInteger              buttonType;
@property (nonatomic , assign) NSInteger              showTime;
@property (nonatomic , assign) NSInteger              sellVolume;
@property (nonatomic , assign) NSInteger              autoOnsaleTimeLeft;
@property (nonatomic , assign) NSInteger              commentWithPicCount;
@property (nonatomic , assign) NSInteger              isPreemption;
@property (nonatomic , assign) BOOL              itemPromValid;
@property (nonatomic , assign) BOOL              zcSearchFlag;
@property (nonatomic , assign) BOOL              itemSizeTableDetailFlag;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , strong) GradientPrice              * gradientPrice;
@property (nonatomic , copy) NSString              * productPlace;
@property (nonatomic , assign) NSInteger              saleCenterSkuId;
@property (nonatomic , assign) NSInteger              status;
@property (nonatomic , assign) NSInteger              pieceNum;
@property (nonatomic , copy) NSString              * flashPageLink;
@property (nonatomic , assign) BOOL              appExclusiveFlag;
@property (nonatomic , assign) NSInteger              limitedFlag;
@property (nonatomic , assign) NSInteger              counterPrice;
@property (nonatomic , assign) NSInteger              primarySkuId;
@property (nonatomic , copy) NSString              * simpleDesc;
@property (nonatomic , assign) NSInteger              itemType;
@property (nonatomic , assign) BOOL              showPoints;
@property (nonatomic , assign) BOOL              forbidExclusiveCal;
@property (nonatomic , assign) NSInteger              displaySkuId;
@property (nonatomic , copy) NSString              * promotionDesc;
@property (nonatomic , copy) NSString              * extraPrice;
@property (nonatomic , assign) BOOL              underShelf;
@property (nonatomic , copy) NSString              * promTag;

/** <#注释#> */
@property (nonatomic, copy) NSString *priceString;

@end

@interface YXGoodsSpecRecommedationModel : YXGoodsSpecBaseModel

/** <#注释#> */
@property (nonatomic, strong) NSMutableArray<YXGoodsSpecRecommedationDataModel *> *recommedationList;
/** <#注释#> */
@property (nonatomic, strong) NSMutableArray<YXGoodsSpecRecommedationDataModel *> *hotGoodsList;

@end
