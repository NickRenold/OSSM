// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZAccelerometerLogEntry.m instead.

#import "_ZZAccelerometerLogEntry.h"

const struct ZZAccelerometerLogEntryAttributes ZZAccelerometerLogEntryAttributes = {
	.x = @"x",
	.y = @"y",
	.z = @"z",
};

const struct ZZAccelerometerLogEntryRelationships ZZAccelerometerLogEntryRelationships = {
};

const struct ZZAccelerometerLogEntryFetchedProperties ZZAccelerometerLogEntryFetchedProperties = {
};

@implementation ZZAccelerometerLogEntryID
@end

@implementation _ZZAccelerometerLogEntry

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ZZAccelerometerLogEntry" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ZZAccelerometerLogEntry";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ZZAccelerometerLogEntry" inManagedObjectContext:moc_];
}

- (ZZAccelerometerLogEntryID*)objectID {
	return (ZZAccelerometerLogEntryID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"xValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"x"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"yValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"y"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"zValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"z"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic x;



- (double)xValue {
	NSNumber *result = [self x];
	return [result doubleValue];
}

- (void)setXValue:(double)value_ {
	[self setX:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveXValue {
	NSNumber *result = [self primitiveX];
	return [result doubleValue];
}

- (void)setPrimitiveXValue:(double)value_ {
	[self setPrimitiveX:[NSNumber numberWithDouble:value_]];
}





@dynamic y;



- (double)yValue {
	NSNumber *result = [self y];
	return [result doubleValue];
}

- (void)setYValue:(double)value_ {
	[self setY:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveYValue {
	NSNumber *result = [self primitiveY];
	return [result doubleValue];
}

- (void)setPrimitiveYValue:(double)value_ {
	[self setPrimitiveY:[NSNumber numberWithDouble:value_]];
}





@dynamic z;



- (double)zValue {
	NSNumber *result = [self z];
	return [result doubleValue];
}

- (void)setZValue:(double)value_ {
	[self setZ:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveZValue {
	NSNumber *result = [self primitiveZ];
	return [result doubleValue];
}

- (void)setPrimitiveZValue:(double)value_ {
	[self setPrimitiveZ:[NSNumber numberWithDouble:value_]];
}










@end
