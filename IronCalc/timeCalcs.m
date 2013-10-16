//
//  timeCalcs.m
//  IronCalc
//
//  Created by Hidalgo Hernandez Eugenio on 13/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "timeCalcs.h"

@implementation timeCalcs


//############################################################################################
/*Recibe un valor float que representa el número de horas y lo pasa a formato de hora tipo 
 hh:mm:ss devolviéndolo en un NSString.
*/
NSString *floatToStringTime (float valor){
    
    int horaI = 0, minI = 0, secI = 0;
    float minF;
    NSString *auxCadena=@"00:00:00", *auxHora, *auxMin, *auxSec;
    
    if (valor != 0){
        horaI=(int)valor;
        minF=(valor-horaI)*60;
        minI=(int)minF;
        secI=(int)((minF-minI)*60);
    
        //En caso de de que haya un solo dígito le añado un cero
        if (horaI<10) auxHora = [NSString stringWithFormat:@"0%d", horaI];
            else auxHora = [NSString stringWithFormat:@"%d",horaI];
    
        if (minI<10) auxMin = [NSString stringWithFormat:@"0%d",minI];
            else auxMin = [NSString stringWithFormat:@"%d",minI];
    
        if (secI<10) auxSec = [NSString stringWithFormat:@"0%d",secI];
            else auxSec = [NSString stringWithFormat:@"%d",secI];
        auxCadena = [NSString stringWithFormat:@"%@:%@:%@",auxHora,auxMin,auxSec];
    } 
    return auxCadena;
}


//############################################################################################
/*Recibe un NSString que contiene un time en formato 00:00:00 y lo pasa a float representando
 el total de horas.
*/
float stringTimeToFloat (NSString *valor){
    
    float aux=0;
    if (valor!=@""){
        NSString *search = @":";
        //Primero obtengo la hora y el resto
        NSRange rango = [valor rangeOfString:search];
        NSString *horaC = [valor substringToIndex:NSMaxRange(rango)];
        NSString *cadena = [valor substringFromIndex:NSMaxRange(rango)];
        
        //Del resto saco los min y los sec
        NSRange rango2 = [cadena rangeOfString:search];
        NSString *minC = [cadena substringToIndex:NSMaxRange(rango2)];
        NSString *secC = [cadena substringFromIndex:NSMaxRange(rango2)];
        
        float horaf=[horaC floatValue];
        float minf=[minC floatValue];
        float secf=[secC floatValue];
        
        aux=horaf+(minf/60)+(secf/3600);
        NSLog(@"------------------------");
        NSLog(@"Valor cadena=%@",valor);
        NSLog(@"Valor hour=%@",horaC);
        NSLog(@"Valor min=%@",minC);
        NSLog(@"Valor sec=%@",secC);
        NSLog(@"Valor aux=%f",aux);
    }
    return aux;
}

@end
