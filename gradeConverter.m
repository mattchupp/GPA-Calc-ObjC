//
//  gradeConveter.m
//  GPAiOS
//
//  Created by Matthew Chupp on 11/19/14.
//  Copyright (c) 2014 MattChupp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gradeConverter.h"


@implementation gradeConverter

- (double)gp: (NSString*)grade{
    
    _gradePoints = 0;
    
    if ([grade isEqualToString:@"A+"] || [grade isEqualToString:@"a+"]) {
        
        _gradePoints = 4.00;
        
        return _gradePoints;
    }
    else if([grade isEqualToString:@"A"] || [grade isEqualToString:@"a"]){
        
        _gradePoints = 3.90;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"A-"] || [grade isEqualToString:@"a-"]){
        
        _gradePoints = 3.70;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"B+"] || [grade isEqualToString:@"b+"]){
        
        _gradePoints = 3.33;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"B"] || [grade isEqualToString:@"b"]){
        
        _gradePoints = 3.00;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"B-"] || [grade isEqualToString:@"b-"]){
        
        _gradePoints = 2.70;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"C+"] || [grade isEqualToString:@"c+"]){
        
        _gradePoints = 2.30;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"C"] || [grade isEqualToString:@"c"]){
        
        _gradePoints = 2.00;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"C-"] || [grade isEqualToString:@"c-"]){
        
        _gradePoints = 1.70;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"D+"] || [grade isEqualToString:@"d+"]){
        
        _gradePoints = 1.30;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"D"] || [grade isEqualToString:@"d"]){
        
        _gradePoints = 1.00;
        
        return _gradePoints;
    }
    
    else if([grade isEqualToString:@"D-"] || [grade isEqualToString:@"d-"]){
        
        _gradePoints = 0.70;
        
        return _gradePoints;
    }
    
    else {
        return 0.00;
    }
    
}

@end

