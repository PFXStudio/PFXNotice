//
//  UIImage+Blur.m
//  NZAlertView
//
//  Created by Bruno Furtado on 20/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "UIImage+Custom.h"

@implementation UIImage (Custom)

- (UIImage *)resizeAspectWithSize:(CGSize)size
{
    CGRect scaledImageRect = CGRectZero;
    
    CGFloat aspectWidth = size.width / self.size.width;
    CGFloat aspectHeight = size.height / self.size.height;
    CGFloat aspectRatio = MIN ( aspectWidth, aspectHeight );
    
    scaledImageRect.size.width = self.size.width * aspectRatio;
    scaledImageRect.size.height = self.size.height * aspectRatio;
    scaledImageRect.origin.x = (size.width - scaledImageRect.size.width) / 2.0f;
    scaledImageRect.origin.y = (size.height - scaledImageRect.size.height) / 2.0f;
    
    UIGraphicsBeginImageContextWithOptions( size, NO, 0 );
    [self drawInRect:scaledImageRect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UIImage *)blurredImage:(CGFloat)blurAmount
{
    if (blurAmount < 0.0 || blurAmount > 1.0) {
        blurAmount = 0.5;
    }
    
    int boxSize = (int)(blurAmount * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = self.CGImage;

    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);

    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    @try {
        if (!error) {
            error = vImageBoxConvolve_ARGB8888(&outBuffer, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        }
    }
    @catch (NSException *exception) {
        return self;
    }
    
    if (error) {
#ifdef DEBUG
        NSLog(@"%s error: %zd", __PRETTY_FUNCTION__, error);
#endif
        
        return self;
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

- (NSString *)saveImage
{
    NSArray *paths = [[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask];
    NSURL *libURL = [paths lastObject];
    ;
    NSString *path = [NSString stringWithFormat:@"%@/%@(%f).png", IMAGES_FOLDERPATH, [libURL absoluteString], [[NSDate date] timeIntervalSince1970]];
    NSString *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    
    [UIImagePNGRepresentation(self) writeToFile:pngPath atomically:YES];
    return pngPath;
}

@end