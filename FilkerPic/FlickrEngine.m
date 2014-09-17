#import "FlickrEngine.h"

@implementation FlickrEngine

-(void) imagesForTag:(NSString*) tag
   completionHandler:(FlickrImagesResponseBlock) imageURLBlock
        errorHandler:(MKNKErrorBlock) errorBlock {

    MKNetworkOperation *op = [self operationWithPath:FLICKR_IMAGE_URL([tag urlEncodedString])];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
    
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
          imageURLBlock(jsonObject[@"photos"][@"photo"]);
        }];        
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
        errorBlock(error);
        
    }];
    
    [self enqueueOperation:op];
}

-(NSString*) cacheDirectoryName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    NSString *cacheDirectoryName = [documentsDirectory stringByAppendingPathComponent:@"FlickrImages"];
    return cacheDirectoryName;
    
}

@end
