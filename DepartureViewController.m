//
//  DepartureViewController.m
//  Tabbar Demo
//
//  Created by Uurtsaikh Batbileg on 12/9/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import "UIViewController+CustomNavigation.h"
#import "DepartureViewController.h"
#import "FlightInfoViewController.h"
#import "FlightListCell.h"
#import "JSON.h"
#import "Reachability.h"


@interface DepartureViewController ()
{
    
    
    NSMutableData *responseData;
    NSMutableArray * parseDict;
    NSMutableArray *flightData;
    
    
    NSMutableDictionary * icao_list;
    
    Reachability *internetReachableFoo;
    
    
}

@end

@implementation DepartureViewController



@synthesize tableViewDep;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![self connected]) {
        // not connected
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Интернэт холболтоо шалгана уу!"
                                                            delegate:self cancelButtonTitle:@"Хаах" otherButtonTitles:nil];
        [alertView show];
        
        
    } else {
        
        // connected, do some internet stuff
        
        [self createAboutButton];
        [self createBackButton];
        
        tableViewDep.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableViewDep.backgroundColor = [FlightTool colorFromHexString:@"f3f3f3"];
        tableViewDep.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        self.tableViewDep.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        
        [self setCustomTitle:[self returnCustomTitle]];
        
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
        
        
        UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
        [[UITabBar appearance] setBackgroundImage:tabBarBackground];
        [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];
        
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, [UIFont fontWithName:@"HelveticaNeue" size:10.0f], UITextAttributeFont, nil] forState:UIControlStateNormal];
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"item.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"item.png"]];
        
        
        responseData = [[NSMutableData data] retain];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:[@"http://202.55.191.108:8084/flighttime/information?date=%@" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], [self returnCurrentDate]]]];
        [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        
        icao_list = [[NSMutableDictionary alloc] init];
        
        [icao_list setObject:@"Арвайхээр" forKey:@"ZMAH"];
        [icao_list setObject:@"Алтай" forKey:@"ZMAT"];
        [icao_list setObject:@"Баянхонгор" forKey:@"ZMBH"];
        [icao_list setObject:@"Булган" forKey:@"ZMBN"];
        [icao_list setObject:@"Булган сум" forKey:@"ZMBS"];
        [icao_list setObject:@"Баруун-Урт" forKey:@"ZMBU"];
        [icao_list setObject:@"Чойбалсан" forKey:@"ZMCD"];
        [icao_list setObject:@"Дадал" forKey:@"ZMDA"];
        [icao_list setObject:@"Доной" forKey:@"ZMDN"];
        [icao_list setObject:@"Даланзадгад" forKey:@"ZMDZ"];
        [icao_list setObject:@"Овоот" forKey:@"ZMGT"];
        [icao_list setObject:@"Хатгал" forKey:@"ZMHG"];
        [icao_list setObject:@"Хархорин" forKey:@"ZMHH"];
        [icao_list setObject:@"Ханбумбат" forKey:@"ZMKB"];
        [icao_list setObject:@"Ховд" forKey:@"ZMKD"];
        [icao_list setObject:@"Мандалговь" forKey:@"ZMMG"];
        [icao_list setObject:@"Мөрөн" forKey:@"ZMMN"];
        [icao_list setObject:@"Скайфрендс" forKey:@"ZMSF"];
        [icao_list setObject:@"Тосонцэнгэл" forKey:@"ZMTL"];
        [icao_list setObject:@"Тавантолгой" forKey:@"ZMTT"];
        [icao_list setObject:@"Улаанбаатар" forKey:@"ZMUB"];
        [icao_list setObject:@"Дэглий цагаан" forKey:@"ZMUG"];
        [icao_list setObject:@"Өндөрхаан" forKey:@"ZMUH"];
        [icao_list setObject:@"Өлгий" forKey:@"ZMUL"];
        
        
      
     
     
        /*********************************************/
        [icao_list setObject:@"Канад"forKey:@"CYYZ"];
        [icao_list setObject:@"Нигериа"forKey:@"DNAA"];
        
          [icao_list setObject:@"Берлин" forKey:@"EDDT"];
        [icao_list setObject:@"Белги"forKey:@"EBMB"];
        [icao_list setObject:@"Берлин"forKey:@"EDDB"];
        [icao_list setObject:@"Франкфурт"forKey:@"EDDF"];
        [icao_list setObject:@"Герман Бонн"forKey:@"EDDK"];
        [icao_list setObject:@"Герман"forKey:@"EDDL"];
        [icao_list setObject:@"Герман"forKey:@"EDDM"];
        [icao_list setObject:@"Герман"forKey:@"EDDN"];
        
        [icao_list setObject:@"Эстони"forKey:@"EEKE"];
        [icao_list setObject:@"Эстони"forKey:@"EETN"];
        [icao_list setObject:@"Финланд"forKey:@"EFHK"];
        [icao_list setObject:@"Англи"forKey:@"EGGW"];
        [icao_list setObject:@"Англи"forKey:@"EGKK"];
        [icao_list setObject:@"Англи"forKey:@"EGLL"];
        [icao_list setObject:@"Недерланд"forKey:@"EHAM"];
        [icao_list setObject:@"Ирланд"forKey:@"EINN"];
        [icao_list setObject:@"Люксенбург"forKey:@"ELLX"];
        [icao_list setObject:@"Польш"forKey:@"EPGD"];
        [icao_list setObject:@"Польш"forKey:@"EPWA"];
        [icao_list setObject:@"Швед"forKey:@"ESSA"];
        [icao_list setObject:@"Египт"forKey:@"HECA"];
        [icao_list setObject:@"АНУ"forKey:@"KEWR"];
        [icao_list setObject:@"АНУ"forKey:@"KIAD"];
        [icao_list setObject:@"АНУ"forKey:@"KJFK"];
        [icao_list setObject:@"АНУ"forKey:@"KORD"];
        [icao_list setObject:@"АНУ"forKey:@"KPAE"];
        [icao_list setObject:@"Испани"forKey:@"LEMD"];
        [icao_list setObject:@"Франц"forKey:@"LFBT"];
        [icao_list setObject:@"Франц"forKey:@"LFPB"];
        [icao_list setObject:@"Франц"forKey:@"LFPV"];
        [icao_list setObject:@"Итали"forKey:@"LIMC"];
        [icao_list setObject:@"Итали"forKey:@"LIRF"];
        [icao_list setObject:@"Швейцарь"forKey:@"LSGG"];
        [icao_list setObject:@"Швейцарь"forKey:@"LSZH"];
        [icao_list setObject:@"Турк"forKey:@"LTBL"];
        [icao_list setObject:@"Турк"forKey:@"LTCG"];
        [icao_list setObject:@"Словак"forKey:@"LZIB"];
        
        [icao_list setObject:@"Дубай" forKey:@"OMDB"];
        [icao_list setObject:@"Афганистан"forKey:@"OAMS"];
        [icao_list setObject:@"Саудын Араб"forKey:@"OEDF"];
        [icao_list setObject:@"Саудын Араб"forKey:@"OERK"];
        [icao_list setObject:@"Иордон"forKey:@"OJAI"];
        [icao_list setObject:@"Кувейт"forKey:@"OKBK"];
        [icao_list setObject:@"Эмират"forKey:@"OMAA"];
        [icao_list setObject:@"Эмират"forKey:@"OMAD"];
     
        [icao_list setObject:@"Эмират"forKey:@"OMDW"];
        [icao_list setObject:@"Эмират"forKey:@"OMSJ"];
        [icao_list setObject:@"Пакистан"forKey:@"OPRN"];
        [icao_list setObject:@"Катар"forKey:@"OTBD"];
        [icao_list setObject:@"Аляска"forKey:@"PAED"];
        [icao_list setObject:@"Аляска"forKey:@"PAFA"];
        [icao_list setObject:@"Аляска"forKey:@"PANC"];
       
        [icao_list setObject:@"Токио Нарита" forKey:@"RJAA"];
        [icao_list setObject:@"Осака" forKey:@"RJBB"];
        [icao_list setObject:@"Токио Ханеда" forKey:@"RJTT"];
       
        
         [icao_list setObject:@"Япон"forKey:@"RJCC"];
         [icao_list setObject:@"Япон"forKey:@"RJFF"];
         [icao_list setObject:@"Япон"forKey:@"RJFM"];
         [icao_list setObject:@"Япон"forKey:@"RJGG"];
         [icao_list setObject:@"Япон"forKey:@"RJNS"];
         [icao_list setObject:@"Япон"forKey:@"RJOA"];
         [icao_list setObject:@"Япон"forKey:@"RJOB"];
         [icao_list setObject:@"Япон"forKey:@"RJOH"];
         [icao_list setObject:@"Япон"forKey:@"RJOI"];
         [icao_list setObject:@"Япон"forKey:@"RJSM"];
         [icao_list setObject:@"Япон"forKey:@"RJSN"];
         [icao_list setObject:@"Япон"forKey:@"RJTA"];
        
         [icao_list setObject:@"Япон"forKey:@"RJTY"];
         [icao_list setObject:@"БНСУ"forKey:@"RKJB"];
        
        
         [icao_list setObject:@"Сөүл Инчеон" forKey:@"RKSI"];
         [icao_list setObject:@"Сөүл Фусан" forKey:@"RKSS"];
         [icao_list setObject:@"Чеонгжу" forKey:@"RKTU"];
         [icao_list setObject:@"БНСУ"forKey:@"RKPC"];
         [icao_list setObject:@"БНСУ"forKey:@"RKPK"];
         [icao_list setObject:@"БНСУ"forKey:@"RKSO"];
       
       
         [icao_list setObject:@"Япон"forKey:@"ROAH"];
         [icao_list setObject:@"БНСУ"forKey:@"RODN"];
         [icao_list setObject:@"Япон"forKey:@"ROTM"];
         [icao_list setObject:@"Филиппин"forKey:@"RPVK"];
         [icao_list setObject:@"Казахстан"forKey:@"UAAA"];
         [icao_list setObject:@"Астана"forKey:@"UACC"];
         [icao_list setObject:@"Казахстан"forKey:@"UASK"];
         [icao_list setObject:@"Казахстан"forKey:@"UATT"];
        
         [icao_list setObject:@"Якут"forKey:@"UEEE"];
         [icao_list setObject:@"ОХУ"forKey:@"UHWW"];
         [icao_list setObject:@"ОХУ"forKey:@"UIAA"];
        
        
        [icao_list setObject:@"Турк" forKey:@"UCFM"];
        [icao_list setObject:@"Эрхүү" forKey:@"UIII"];
        [icao_list setObject:@"Улаан-Үүд" forKey:@"UIUU"];
        [icao_list setObject:@"Москва" forKey:@"UUEE"];
        
         [icao_list setObject:@"Украйн"forKey:@"UKBB"];
         [icao_list setObject:@"Украйн"forKey:@"UKKK"];
         [icao_list setObject:@"Беларус"forKey:@"UMMS"];
         [icao_list setObject:@"Абакан"forKey:@"UNAA"];
         [icao_list setObject:@"Кемеров"forKey:@"UNEE"];
         [icao_list setObject:@"Красноярс"forKey:@"UNKL"];
         [icao_list setObject:@"Новосибирск"forKey:@"UNNT"];
         [icao_list setObject:@"Омск"forKey:@"UNOO"];
         [icao_list setObject:@"Волоград"forKey:@"URWW"];
         [icao_list setObject:@"Челябинск"forKey:@"USCC"];
         [icao_list setObject:@"ОХУ"forKey:@"USHH"];
         [icao_list setObject:@"ОХУ"forKey:@"USNN"];
         [icao_list setObject:@"ОХУ"forKey:@"USPP"];
         [icao_list setObject:@"ОХУ Сургут"forKey:@"USRR"];
         [icao_list setObject:@"ОХУ"forKey:@"USSS"];
         [icao_list setObject:@"ОХУ"forKey:@"USTR"];
         [icao_list setObject:@"ОХУ"forKey:@"UTSA"];
         [icao_list setObject:@"ОХУ"forKey:@"UTST"];
         [icao_list setObject:@"ОХУ"forKey:@"UTTT"];
         [icao_list setObject:@"ОХУ"forKey:@"UUBW"];
        
        
         [icao_list setObject:@"ОХУ Домододево"forKey:@"UUDD"];
        
         [icao_list setObject:@"ОХУ Внукова"forKey:@"UUWW"];
         [icao_list setObject:@"ОХУ Казан"forKey:@"UWKD"];
         [icao_list setObject:@"ОХУ"forKey:@"UWWW"];
        
        
         [icao_list setObject:@"Бангладеш"forKey:@"VGFR"];
         [icao_list setObject:@"Бангладеш"forKey:@"VGHS"];
         [icao_list setObject:@"Хонгконг"forKey:@"VHHH"];
         [icao_list setObject:@"Энэтхэг"forKey:@"VIDP"];
         [icao_list setObject:@"Макао"forKey:@"VMMC"];
         [icao_list setObject:@"Тайланд"forKey:@"VTBD"];
         [icao_list setObject:@"Тайланд"forKey:@"VTBS"];
         [icao_list setObject:@"Вьетнам"forKey:@"VVNB"];
        
        
        
        [icao_list setObject:@"Хонгконг" forKey:@"VHHH"];
        [icao_list setObject:@"Бангконг" forKey:@"VTBD"];
        [icao_list setObject:@"Тайланд" forKey:@"VTBS"];
        [icao_list setObject:@"ОХУ" forKey:@"UHMM"];
        
        
        [icao_list setObject:@"Малайз"forKey:@"WBKS"];
        [icao_list setObject:@"Индонез"forKey:@"WIHH"];
        [icao_list setObject:@"Сингапур"forKey:@"WSSL"];
        [icao_list setObject:@"Сингапур"forKey:@"WSSS"];
        
         [icao_list setObject:@"Манжуур"forKey:@"ZBMZ"];
         [icao_list setObject:@"Хятад"forKey:@"ZBSJ"];
         [icao_list setObject:@"Тяньжин"forKey:@"ZBTJ"];
         [icao_list setObject:@"БНХАУ Тайюан"forKey:@"ZBYN"];
         [icao_list setObject:@"БНХАУ"forKey:@"ZGDY"];
         [icao_list setObject:@"БНХАУ"forKey:@"ZGGG"];
         [icao_list setObject:@"БНХАУ Гуанжу"forKey:@"ZJHK"];
         [icao_list setObject:@"БНХАУ Саня"forKey:@"ZJSY"];
         [icao_list setObject:@"БНХАУ"forKey:@"ZLXY"];
         [icao_list setObject:@"БНХАУ Куминг"forKey:@"ZPPP"];
         [icao_list setObject:@"БНХАУ Фузоу"forKey:@"ZSFZ"];
         [icao_list setObject:@"БНХАУ"forKey:@"ZSHC"];
         [icao_list setObject:@"БНХАУ Жинан"forKey:@"ZSJN"];
         [icao_list setObject:@"БНХАУ"forKey:@"ZSNJ"];
         [icao_list setObject:@"Шанхай"forKey:@"ZSSS"];
         [icao_list setObject:@"БНХАУ"forKey:@"ZUGY"];
         [icao_list setObject:@"БНХАУ"forKey:@"ZUUU"];
         [icao_list setObject:@"БНХАУ"forKey:@"ZYCC"];
         [icao_list setObject:@"Харбин"forKey:@"ZYHB"];
         [icao_list setObject:@"БНХАУ Далиан"forKey:@"ZYTL"];
         [icao_list setObject:@"БНХАУ Шенянь"forKey:@"ZYTX"];
         [icao_list setObject:@"Бээжин" forKey:@"ZBAA"];
        [icao_list setObject:@"Эрээн" forKey:@"ZBER"];
        [icao_list setObject:@"Хөххот" forKey:@"ZBHH"];
        [icao_list setObject:@"Хайлаар" forKey:@"ZBLA"];
        [icao_list setObject:@"Шижиазхуанг" forKey:@"ZBSJ"];
        [icao_list setObject:@"Үрүмч" forKey:@"ZWWW"];
        [icao_list setObject:@"Шанхай" forKey:@"ZSPD"];

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        ODRefreshControl * refreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableViewDep];
        [refreshControl addTarget:self action:@selector(refreshBegin:) forControlEvents:UIControlEventValueChanged];
        
        
    }
    
    
}

- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:YES];
    
    tableViewDep.contentInset = UIEdgeInsetsZero;
    
}

- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    [self setCustomTitle:[self returnCustomTitle]];
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -  UITableView delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [flightData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    FlightListCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[FlightListCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:MyIdentifier] ;
    }
    
    
    // setup company logo
    
    BOOL is_chapter = true;
    
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"MML"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"hunnu.png"]];
        is_chapter = false;
        
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"CCA"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"airchina.png"]];
        is_chapter = false;
        
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"MGL"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"miat.png"]];
        is_chapter = false;
        
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"MNG"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"aeromongolia.png"]];
        is_chapter = false;
        
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"EZA"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"eznis.png"]];
        is_chapter = false;
        
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"THY"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"turkish.png"]];
        is_chapter = false;
        
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"AFL"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"aeroflot.png"]];
        is_chapter = false;
        
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"KAL"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"koreanair.png"]];
        is_chapter = false;
        
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"] isEqualToString:@"TNL"]) {
        
        [cell.logo setImage:[UIImage imageNamed:@"sky_horse.png"]];
        is_chapter = false;
        
    }		
    
    
    if (is_chapter) {
        
        [cell.logo setImage:[UIImage imageNamed:@"chapter.png"]];
    
    }
    
    
    
    cell.voyage_number.text = [[flightData objectAtIndex:indexPath.row] valueForKey:@"voyage_num"];
    cell.takeOffTime.text = [[flightData objectAtIndex:indexPath.row] valueForKey:@"takeoff_time"];
    cell.landedTime.text = [[flightData objectAtIndex:indexPath.row] valueForKey:@"landing_time"];
    cell.line.text = @"-";
    
    cell.direction.text = [NSString stringWithFormat:@"%@ - %@",[self returnDirectionName:[[flightData objectAtIndex:indexPath.row] valueForKey:@"dep_checkpoint"] ],[self returnDirectionName:[[flightData objectAtIndex:indexPath.row] valueForKey:@"arr_checkpoint"]]];
    
    cell.status.text = [self returnStatus:[[flightData objectAtIndex:indexPath.row] valueForKey:@"status"]];
    
    
    return cell;
    
    
}


- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
  
    FlightInfoViewController * flightController = [[FlightInfoViewController alloc] init];
    
    flightController.textVoyageNum = [[flightData objectAtIndex:indexPath.row] valueForKey:@"voyage_num"];
    flightController.textLogoName = [[flightData objectAtIndex:indexPath.row] valueForKey:@"company_abbr"];
    flightController.textCompanyName = [[flightData objectAtIndex:indexPath.row] valueForKey:@"company"];
    flightController.textDirection = [NSString stringWithFormat:@"%@ - %@",[self returnDirectionName:[[flightData objectAtIndex:indexPath.row] valueForKey:@"dep_checkpoint"] ],[self returnDirectionName:[[flightData objectAtIndex:indexPath.row] valueForKey:@"arr_checkpoint"]]];
    flightController.textTakeOffTime = [[flightData objectAtIndex:indexPath.row] valueForKey:@"takeoff_time"];
    flightController.textLandingTime = [[flightData objectAtIndex:indexPath.row] valueForKey:@"landing_time"];
    flightController.textDuration = [[flightData objectAtIndex:indexPath.row] valueForKey:@"duration"];
    flightController.textStatus = [self returnStatus:[[flightData objectAtIndex:indexPath.row] valueForKey:@"status"]];
    flightController.textCurrentDate = [self returnCurrentDateLabel];
    flightController.textPlanTime = [[flightData objectAtIndex:indexPath.row] valueForKey:@"plan_time"];
    flightController.textAircraftType = [[flightData objectAtIndex:indexPath.row] valueForKey:@"aircraft_type"];
    
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"voyage_type"] isEqualToString:@"1"]) {
        flightController.textVoyageType = @"Олон улсын нислэг";
    }
    if ([[[flightData objectAtIndex:indexPath.row] valueForKey:@"voyage_type"] isEqualToString:@"2"]) {
        flightController.textVoyageType = @"Орон нутгийн нислэг";
    }
    
    [self.navigationController pushViewController:flightController animated:YES];
    
    
}


#pragma CONNECTION

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"Connection failed1: %@", [error description]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
	[connection release];
    
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	
    [responseData release];
    
	NSMutableArray * tempData = (NSMutableArray*)[responseString JSONValue];
    
    NSMutableArray * ustgah = [[NSMutableArray alloc] init];
    
    for (NSDictionary * data in tempData)
    {
        
        if ([[data valueForKey:@"flight_type"] isEqualToString:@"ARRIVAL"])
        {
            [ustgah addObject:data];
        }
        
        
    }
    
    
    [tempData removeObjectsInArray:ustgah];
    
    parseDict = tempData;
    
    flightData = [[NSMutableArray alloc] initWithArray:parseDict];
    
    [tableViewDep reloadData];
    
    
}



- (NSString *) returnDirectionName: (NSString *) icao_code
{
    if ([[icao_list objectForKey:icao_code] length] == 0) {
        return icao_code;
    } else {
        return [icao_list objectForKey:icao_code];
    }
}



- (void) refreshBegin:(ODRefreshControl *) refreshControl
{
    
    double delayInSeconds = 1.0;
    dispatch_time_t poptime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(poptime, dispatch_get_main_queue(), ^(void){[refreshControl endRefreshing];});
   
    if (![self connected]) {
        // not connected
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Интернэт холболтоо шалгана уу!"
                                                            delegate:self cancelButtonTitle:@"Хаах" otherButtonTitles:nil];
        [alertView show];
        
        
    } else {
    
        
        NSLog(@"Refreshing");
        
        responseData = [[NSMutableData data] retain] ;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://202.55.191.108:8084/flighttime/information?date=%@", [self returnCurrentDate]]]];
        [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        
    }
   
}

- (NSString * ) returnStatus: (NSString *) stat
{
    NSString * returnStatusText;
    
    if ([stat isEqualToString:@"ARRIVED"]) {
        returnStatusText = @"Онгоц буусан";
    }
    if ([stat isEqualToString:@"DEPARTED"]) {
        returnStatusText = @"Онгоц хөөрсөн";
    }
    if ([stat isEqualToString:@"FPL"]) {
        returnStatusText = @"Бүртгэл явагдаж байна";
    }
    if ([stat isEqualToString:@"PLANNED"]) {
        returnStatusText = @"Төлөвлөгдсөн нислэг";
    }
    if ([stat isEqualToString:@"DELAYED"]) {
        returnStatusText = @"Саатсан нислэг";
    }
    if ([stat isEqualToString:@"CNL"]) {
        returnStatusText = @"Цуцлагдсан нислэг";
    }
    if ([stat isEqualToString:@"FPL DLA"]) {
        returnStatusText = @"Саатсан нислэг";
    }
    return returnStatusText;
}

// return Custom title text with current date.

- (NSString * ) returnCustomTitle
{
    NSString * returnString;
    
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"yyyy.MM.dd"];

    returnString = [NSString stringWithFormat:@"%@-н НИСЛЭГҮҮД",[DateFormatter stringFromDate:[NSDate date]]];
    
    return returnString;
    
}


// return current date
- (NSString *) returnCurrentDate
{

    NSString * returnDate;
    
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MMM-yyyy"];
    returnDate = [dateFormat stringFromDate:[NSDate date]];
    
    return returnDate;
    
}

// return current date
- (NSString *) returnCurrentDateLabel
{
    
    NSString * returnDate;
    
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy.MM.dd"];
    returnDate = [dateFormat stringFromDate:[NSDate date]];
    
    return returnDate;
    
}


- (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}



@end
