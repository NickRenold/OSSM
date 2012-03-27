// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZLog.h instead.

#import <CoreData/CoreData.h>
#import "ZZServerObject.h"

extern const struct ZZLogAttributes {
	 NSString *endTime;
	 NSString *name;
	 NSString *startTime;
} ZZLogAttributes;

extern const struct ZZLogRelationships {
	 NSString *accelerometerLogEntries;
	 NSString *cameraLogEntries;
	 NSString *microphoneLogEntries;
} ZZLogRelationships;

extern const struct ZZLogFetchedProperties {
} ZZLogFetchedProperties;

@class ZZAccelerometerLogEntry;
@class ZZLogEntry;
@class ZZLogEntry;





@interface ZZLogID : NSManagedObjectID {}
@end

@interface _ZZLog : ZZServerObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ZZLogID*)objectID;




@property (nonatomic, retain) NSDate *endTime;


//- (BOOL)validateEndTime:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSDate *startTime;


//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSSet* accelerometerLogEntries;

- (NSMutableSet*)accelerometerLogEntriesSet;




@property (nonatomic, retain) ZZLogEntry* cameraLogEntries;

//- (BOOL)validateCameraLogEntries:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) ZZLogEntry* microphoneLogEntries;

//- (BOOL)validateMicrophoneLogEntries:(id*)value_ error:(NSError**)error_;





@end

@interface _ZZLog (CoreDataGeneratedAccessors)

- (void)addAccelerometerLogEntries:(NSSet*)value_;
- (void)removeAccelerometerLogEntries:(NSSet*)value_;
- (void)addAccelerometerLogEntriesObject:(ZZAccelerometerLogEntry*)value_;
- (void)removeAccelerometerLogEntriesObject:(ZZAccelerometerLogEntry*)value_;

@end

@interface _ZZLog (CoreDataGeneratedPrimitiveAccessors)


- (NSDate *)primitiveEndTime;
- (void)setPrimitiveEndTime:(NSDate *)value;




- (NSString *)primitiveName;
- (void)setPrimitiveName:(NSString *)value;




- (NSDate *)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate *)value;





- (NSMutableSet*)primitiveAccelerometerLogEntries;
- (void)setPrimitiveAccelerometerLogEntries:(NSMutableSet*)value;



- (ZZLogEntry*)primitiveCameraLogEntries;
- (void)setPrimitiveCameraLogEntries:(ZZLogEntry*)value;



- (ZZLogEntry*)primitiveMicrophoneLogEntries;
- (void)setPrimitiveMicrophoneLogEntries:(ZZLogEntry*)value;


@end
