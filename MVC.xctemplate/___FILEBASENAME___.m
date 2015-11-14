//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"
#import "Reachability.h"
#import "ServerManager.h"
#import "DatabaseManager.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

+ (___FILEBASENAMEASIDENTIFIER___*)sharedInstance{
    static dispatch_once_t onceToken;
    static ___FILEBASENAMEASIDENTIFIER___ *singelton = nil;
    dispatch_once(&onceToken, ^{
        singelton = [[___FILEBASENAMEASIDENTIFIER___ alloc] init];
    });
    return singelton;
}

-(void)get/**(__Data__)*/DataWithCompletion:(void (^)(/**(Return __Data__)*/))completion{
    DatabaseManager *dataBaseManager = [[DatabaseManager alloc]init];
    
    if (/**/) {//if you have data on DataBase Get Data from DataBase
        //load direct from DataBase
        NSLog(@"Get From DataBase");
        
        
        completion(/**(Return __Data__)*/);
        
    }else{ //Get Data From API
        
        //get More data From API
        
        reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
        [reachability startNotifier];
        
        //Have Internet Connection
        reachability.reachableBlock = ^(Reachability * reachability)
        {
            NSString * temp = [NSString stringWithFormat:@"GOOGLE Block Says Reachable(%@)", reachability.currentReachabilityString];
            NSLog(@"%@", temp);
            

                completion(/**(Return __Data__)*/);
        };
        //No Internet Connection
        reachability.unreachableBlock = ^(Reachability * reachability)
        {
            //Get From Data From DataBase

            NSString * temp = [NSString stringWithFormat:@"GOOGLE Block Says Unreachable(%@)", reachability.currentReachabilityString];
            NSLog(@"%@", temp);
            
            completion(/**(Return __Data__)*/);
            
        };
    }
    
}

@end
