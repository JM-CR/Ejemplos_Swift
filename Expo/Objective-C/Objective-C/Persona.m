//
//  Persona.m
//  Objective-C
//
//  Created by Contreras Rocha Josue Mosiah on 10/10/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Persona.h"

@implementation Persona

-(void) setNombre: (NSString *) nombre {
    self.nombre = nombre;
}

-(void) setApPaterno: (NSString *) apPaterno {
    self.apPaterno = apMaterno;
}

-(void) setApMaterno: (NSString *) apMaterno {
    self.apMaterno = apMaterno;
}

-(void) setFechaNac: (NSDate *) fechaNac {
    self.fechaNac = fechaNac;
}

-(int)edad {
    NSDate *hoy = [[NSDate alloc] init];
    NSTimeInterval segEntre = [hoy timeIntervalSinceDate: self.fechaNac];
    int años = segEntre / (86400 * 365);
    return años;
}

-(NSString *) nombre { return self.nombre; }
-(NSString *) apPaterno { return self.apPaterno; }
-(NSString *) apMaterno { return self.apMaterno; }
-(NSDate *) fechaNac { return self.fechaNac; }

@end
