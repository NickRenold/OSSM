// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZSession.h instead.

#import <CoreData/CoreData.h>


extern const struct ZZSessionAttributes {
	 NSString *alarmTime;
	 NSString *emailAddress;
	 NSString *logAccelerometer;
	 NSString *logMicrophone;
} ZZSessionAttributes;

extern const struct ZZSessionRelationships {
} ZZSessionRelationships;

extern const struct ZZSessionFetchedProperties {
} ZZSessionFetchedProperties;







@interface ZZSessionID : NSManagedObjectID {}
@end

@interface _ZZSession : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ZZSessionID*)objectID;




@property (nonatomic, retain) NSDate *alarmTime;


//- (BOOL)validateAlarmTime:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *emailAddress;


//- (BOOL)validateEmailAddress:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *logAccelerometer;


@property BOOL logAccelerometerValue;
- (BOOL)logAccelerometerValue;
- (void)setLogAccelerometerValue:(BOOL)value_;

//- (BOOL)validateLogAccelerometer:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *logMicrophone;


@property BOOL logMicrophoneValue;
- (BOOL)logMicrophoneValue;
- (void)setLogMicrophoneValue:(BOOL)value_;

//- (BOOL)validateLogMicrophone:(id*)value_ error:(NSError**)error_;






@end

@interface _ZZSession (CoreDataGeneratedAccessors)

@end

@interface _ZZSession (CoreDataGeneratedPrimitiveAccessors)


- (NSDate *)primitiveAlarmTime;
- (void)setPrimitiveAlarmTime:(NSDate *)value;




- (NSString *)primitiveEmailAddress;
- (void)setPrimitiveEmailAddress:(NSString *)value;




- (NSNumber *)primitiveLogAccelerometer;
- (void)setPrimitiveLogAccelerometer:(NSNumber *)value;

- (BOOL)primitiveLogAccelerometerValue;
- (void)setPrimitiveLogAccelerometerValue:(BOOL)value_;




- (NSNumber *)primitiveLogMicrophone;
- (void)setPrimitiveLogMicrophone:(NSNumber *)value;

- (BOOL)primitiveLogMicrophoneValue;
- (void)setPrimitiveLogMicrophoneValue:(BOOL)value_;




@end
