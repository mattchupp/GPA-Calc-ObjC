//
//  gpaClass.m
//  GPAiOS
//
//  Created by Matthew Chupp on 11/18/14.
//  Copyright (c) 2014 MattChupp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gpaClass.h"

@implementation gpaCalc

- (double) gpaByClass:(double)classGP hours:(double)classHours{
    
    double gpXch = classGP * classHours;
    
    return gpXch;
    
}

@end


