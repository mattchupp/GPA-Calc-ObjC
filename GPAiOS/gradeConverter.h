//
//  gradeConverter.h
//  GPAiOS
//
//  Created by Matthew Chupp on 11/18/14.
//  Copyright (c) 2014 MattChupp. All rights reserved.
//

#ifndef GPAiOS_gradeConverter_h
#define GPAiOS_gradeConverter_h

@interface gradeConverter : NSObject

@property double gradePoints;

- (double) gp: (NSString*)grade;

@end


#endif
