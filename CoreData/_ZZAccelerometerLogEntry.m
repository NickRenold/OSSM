// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZAccelerometerLogEntry.m instead.

#import "_ZZAccelerometerLogEntry.h"

const struct ZZAccelerometerLogEntryAttributes ZZAccelerometerLogEntryAttributes = {
	.filteredX = @"filteredX",
	.filteredY = @"filteredY",
	.filteredZ = @"filteredZ",
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
	
	if ([key isEqualToString:@"filteredXValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"filteredX"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"filteredYValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"filteredY"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"filteredZValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"filteredZ"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
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




@dynamic filteredX;



- (double)filteredXValue {
	NSNumber *result = [self filteredX];
	return [result doubleValue];
}

- (void)setFilteredXValue:(double)value_ {
	[self setFilteredX:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveFilteredXValue {
	NSNumber *result = [self primitiveFilteredX];
	return [result doubleValue];
}

- (void)setPrimitiveFilteredXValue:(double)value_ {
	[self setPrimitiveFilteredX:[NSNumber numberWithDouble:value_]];
}





@dynamic filteredY;



- (double)filteredYValue {
	NSNumber *result = [self filteredY];
	return [result doubleValue];
}

- (void)setFilteredYValue:(double)value_ {
	[self setFilteredY:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveFilteredYValue {
	NSNumber *result = [self primitiveFilteredY];
	return [result doubleValue];
}

- (void)setPrimitiveFilteredYValue:(double)value_ {
	[self setPrimitiveFilteredY:[NSNumber numberWithDouble:value_]];
}





@dynamic filteredZ;



- (double)filteredZValue {
	NSNumber *result = [self filteredZ];
	return [result doubleValue];
}

- (void)setFilteredZValue:(double)value_ {
	[self setFilteredZ:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveFilteredZValue {
	NSNumber *result = [self primitiveFilteredZ];
	return [result doubleValue];
}

- (void)setPrimitiveFilteredZValue:(double)value_ {
	[self setPrimitiveFilteredZ:[NSNumber numberWithDouble:value_]];
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
