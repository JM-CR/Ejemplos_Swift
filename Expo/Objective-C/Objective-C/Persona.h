//
//  Persona.h
//  Objective-C
//
//  Created by Contreras Rocha Josue Mosiah on 10/10/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

#import <Foundation/NSObject.h>
@interface Persona: NSObject {
    NSString *nombre;
    NSString *apPaterno;
    NSString *apMaterno;
    NSDate *fechaNac;
    int edad;
}

-(void) setNombre: (NSString *) nombre;
-(void) setApPaterno: (NSString *) apPaterno;
-(void) setApMaterno: (NSString *) apMaterno;
-(void) setFechaNac: (NSDate *) fechaNac;
-(NSString *) nombre;
-(NSString *) apPaterno;
-(NSString *) apMaterno;
-(NSDate *) fechaNac;
-(int) edad;

@end
