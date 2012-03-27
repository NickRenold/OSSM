// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZLogEntry.h instead.

#import <CoreData/CoreData.h>


extern const struct ZZLogEntryAttributes {
	 NSString *endTime;
	 NSString *value;
} ZZLogEntryAttributes;

extern const struct ZZLogEntryRelationships {
	 NSString *log;
} ZZLogEntryRelationships;

extern const struct ZZLogEntryFetchedProperties {
} ZZLogEntryFetchedProperties;

@class ZZLog;




@interface ZZLogEntryID : NSManagedObjectID {}
@end

@interface _ZZLogEntry : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ZZLogEntryID*)objectID;




@property (nonatomic, retain) NSDate *endTime;


//- (BOOL)validateEndTime:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *value;


@property double valueValue;
- (double)valueValue;
- (void)setValueValue:(double)value_;

//- (BOOL)validateValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) ZZLog* log;

//- (BOOL)validateLog:(id*)value_ error:(NSError**)error_;





@end

@interface _ZZLogEntry (CoreDataGeneratedAccessors)

@end

@interface _ZZLogEntry (CoreDataGeneratedPrimitiveAccessors)


- (NSDate *)primitiveEndTime;
- (void)setPrimitiveEndTime:(NSDate *)value;




- (NSNumber *)primitiveValue;
- (void)setPrimitiveValue:(NSNumber *)value;

- (double)primitiveValueValue;
- (void)setPrimitiveValueValue:(double)value_;





- (ZZLog*)primitiveLog;
- (void)setPrimitiveLog:(ZZLog*)value;


@end
