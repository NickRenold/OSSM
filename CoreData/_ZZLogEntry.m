// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ZZLogEntry.m instead.

#import "_ZZLogEntry.h"

const struct ZZLogEntryAttributes ZZLogEntryAttributes = {
	.endTime = @"endTime",
	.value = @"value",
};

const struct ZZLogEntryRelationships ZZLogEntryRelationships = {
	.log = @"log",
};

const struct ZZLogEntryFetchedProperties ZZLogEntryFetchedProperties = {
};

@implementation ZZLogEntryID
@end

@implementation _ZZLogEntry

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ZZLogEntry" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ZZLogEntry";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ZZLogEntry" inManagedObjectContext:moc_];
}

- (ZZLogEntryID*)objectID {
	return (ZZLogEntryID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"valueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"value"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic endTime;






@dynamic value;



- (double)valueValue {
	NSNumber *result = [self value];
	return [result doubleValue];
}

- (void)setValueValue:(double)value_ {
	[self setValue:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveValueValue {
	NSNumber *result = [self primitiveValue];
	return [result doubleValue];
}

- (void)setPrimitiveValueValue:(double)value_ {
	[self setPrimitiveValue:[NSNumber numberWithDouble:value_]];
}





@dynamic log;

	






@end
