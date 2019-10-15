//
//  main.m
//  Objective-C
//
//  Created by Contreras Rocha Josue Mosiah on 10/10/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

#import "Persona.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Persona *rafa = [[Persona alloc] init];
        [rafa setNombre: @"Rafa"];
        [rafa setApPaterno: @"Gorgory"];
        [rafa setApMaterno: @"."];
        [rafa setFechaNac: [NSDate dateWithString: @"2010-01-02 10:00:00 +0000"]];
        NSLog(@"La edad de %@ es %d", [rafa nombre], [rafa edad]);
    }
    return 0;
}
