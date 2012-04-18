// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZAccelerometerLogEntry.h instead.

#import <CoreData/CoreData.h>
#import "ZZLogEntry.h"

extern const struct ZZAccelerometerLogEntryAttributes {
	 NSString *x;
	 NSString *y;
	 NSString *z;
} ZZAccelerometerLogEntryAttributes;

extern const struct ZZAccelerometerLogEntryRelationships {
} ZZAccelerometerLogEntryRelationships;

extern const struct ZZAccelerometerLogEntryFetchedProperties {
} ZZAccelerometerLogEntryFetchedProperties;






@interface ZZAccelerometerLogEntryID : NSManagedObjectID {}
@end

@interface _ZZAccelerometerLogEntry : ZZLogEntry {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ZZAccelerometerLogEntryID*)objectID;




@property (nonatomic, retain) NSNumber *x;


@property double xValue;
- (double)xValue;
- (void)setXValue:(double)value_;

//- (BOOL)validateX:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *y;


@property double yValue;
- (double)yValue;
- (void)setYValue:(double)value_;

//- (BOOL)validateY:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *z;


@property double zValue;
- (double)zValue;
- (void)setZValue:(double)value_;

//- (BOOL)validateZ:(id*)value_ error:(NSError**)error_;






@end

@interface _ZZAccelerometerLogEntry (CoreDataGeneratedAccessors)

@end

@interface _ZZAccelerometerLogEntry (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber *)primitiveX;
- (void)setPrimitiveX:(NSNumber *)value;

- (double)primitiveXValue;
- (void)setPrimitiveXValue:(double)value_;




- (NSNumber *)primitiveY;
- (void)setPrimitiveY:(NSNumber *)value;

- (double)primitiveYValue;
- (void)setPrimitiveYValue:(double)value_;




- (NSNumber *)primitiveZ;
- (void)setPrimitiveZ:(NSNumber *)value;

- (double)primitiveZValue;
- (void)setPrimitiveZValue:(double)value_;




@end
