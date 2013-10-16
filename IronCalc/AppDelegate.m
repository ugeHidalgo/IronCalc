//
//  AppDelegate.m
//  IronCalc
//
//  Created by Hidalgo Hernandez Eugenio on 12/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "timeCalcs.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize swimDistance = _swimDistance;
@synthesize bikeDistance = _bikeDistance;
@synthesize runDistance = _runDistance;
@synthesize swimTime = _swimTime;
@synthesize t1Time = _t1Time;
@synthesize bikeTime = _bikeTime;
@synthesize t2Time = _t2Time;
@synthesize runTime = _runTime;
@synthesize totalTime = _totalTime;
@synthesize speedTimeSwim = _speedTimeSwim;
@synthesize speedDistanceSwim = _speedDistanceSwim;
@synthesize speedBike = _speedBike;
@synthesize speedRun = _speedRun;
@synthesize rithmRun = _rithmRun;




- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

//#########################################
- (IBAction)calculateSwimTime:(id)sender {
    
    boolean_t calcula = true;
    float speedTime = 0;
    NSString *time=@"";
    float tiempo = 0;
    float velocidad = 0;
    float distancia = [_swimDistance floatValue];
    NSString *auxspeedTime = [_speedTimeSwim stringValue];
    float speedDistance = [_speedDistanceSwim floatValue];
    
    
    if ([auxspeedTime isEqualToString:@""]) calcula=false;
    if (distancia==0) calcula=false;
    if (speedDistance==0) calcula=false;
    
    if (calcula) {
        speedTime = stringTimeToFloat(auxspeedTime);
        if (speedTime>0){
            velocidad = (speedDistance/1000)/speedTime;
            if (velocidad>0){
                tiempo = distancia/velocidad;
                time = floatToStringTime(tiempo);    
            } 
        }
    }
    
    [_swimTime setStringValue:time];
    [self calculateTotalTime:sender];
    
/*NSLog(@"----------------------------");
    NSLog(@"Distancia float=%f",distancia);
    NSLog(@"SpeedTime float=%f",speedTime);
    NSLog(@"auxSpeedTime cadena=%@",auxspeedTime);
    NSLog(@"SpeedDistance float=%f",speedDistance);
    NSLog(@"Tiempo float=%f",tiempo);
    NSLog(@"Tiempo cadena=%@",time);
*/    

}

//#########################################
- (IBAction)calculateBikeTime:(id)sender {
    float distancia = [_bikeDistance floatValue];
    float velocidad = [_speedBike floatValue];
    NSString *auxCadena=@"";
    boolean_t calcula=true;
    
    if (distancia==0) calcula=false;
    if (velocidad==0) calcula=false;
    
    if (calcula){
        float tiempo = distancia/velocidad;
        auxCadena = floatToStringTime(tiempo);
    }
        
    [_bikeTime setStringValue:auxCadena];
    [self calculateTotalTime:sender];
}

//#########################################
- (IBAction)calculateRunTime:(id)sender {
    
    
    [self calculateTotalTime:sender];
}

//#########################################
- (IBAction)calculateTotalTime:(id)sender {
    NSString *swimTime = [_swimTime stringValue];
    NSString *t1Time = [_t1Time stringValue];
    NSString *bikeTime = [_bikeTime stringValue];
    NSString *t2Time = [_t2Time stringValue];
    NSString *runTime = [_runTime stringValue];
    NSString *auxCadena = @"";
    float swimTF=0, t1TF=0, bikeTF=0, t2TF=0, runTF=0, totalTF=0;
    
    if (![swimTime isEqualToString:@""]){
        swimTF=stringTimeToFloat(swimTime);   
    } 
    if (![t1Time isEqualToString:@""]){
        t1TF=stringTimeToFloat(t1Time);   
    }
    if (![bikeTime isEqualToString:@""]){
        bikeTF=stringTimeToFloat(bikeTime);   
    }
    if (![t2Time isEqualToString:@""]){
        t2TF=stringTimeToFloat(t2Time);   
    }
    if (![runTime isEqualToString:@""]){
        runTF=stringTimeToFloat(runTime);   
    }
    
    totalTF = swimTF + t1TF + bikeTF + t2TF + runTF;
    
    auxCadena=floatToStringTime(totalTF);
    [_totalTime setStringValue:auxCadena];
}
@end
